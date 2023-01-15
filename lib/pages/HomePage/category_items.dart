import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:store_it/components/confirmation_modal.dart';
import 'package:store_it/config/logger_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_it/domain/HomePage/LogicFunctions/category_items_data_service.dart';
import 'package:store_it/domain/HomePage/Models/CategoryItem/category_item_model.dart';
import 'package:intl/intl.dart';
import 'package:store_it/pages/HomePage/change_pass_bottomsheet.dart';
import 'package:store_it/pages/HomePage/manage_category_modal.dart';
import 'package:store_it/pages/HomePage/password_enter_modal.dart';
import 'package:store_it/providers/home_page_providers.dart';
import 'dart:ui';

class CategoryItems extends StatefulWidget {
  const CategoryItems({Key? key}) : super(key: key);

  @override
  CategoryItemsState createState() => CategoryItemsState();
}

class CategoryItemsState extends State<CategoryItems> {
  //list to set the items
  List<CategoryItemModel> _fetchResult = [];

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late StreamSubscription _dataListen;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //on Component init , listen to db data
  @override
  void initState() {
    super.initState();
    _dataListen = _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('categoryItems')
        .snapshots()
        .listen((snapshot) {
      List<CategoryItemModel> temp = [];
      try {
        temp = snapshot.docs
            .map((e) => e.data())
            .toList()
            .map((value) => CategoryItemModel.fromJson(value))
            .toList();
      } catch (e) {
        appLogNoStack.e(e.toString());
      }
      setState(() {
        _fetchResult = temp;
      });
    });
  }

//dispose the data
  @override
  void dispose() {
    _dataListen.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget proxyDecorator(
        Widget child, int index, Animation<double> animation) {
      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          final double animValue = Curves.easeInOut.transform(animation.value);
          final double elevation = lerpDouble(0, 6, animValue)!;
          return Material(
            elevation: elevation,
            child: child,
          );
        },
        child: child,
      );
    }

    return ReorderableListView(
      padding: EdgeInsets.only(top: 150.h),
      proxyDecorator: proxyDecorator,
      children: <Widget>[
        for (int index = 0; index < _fetchResult.length; index += 1)
          ListItem(
            item: _fetchResult[index],
            key: Key('$index'),
          ),
      ],
      onReorder: (int oldIndex, int newIndex) {
        setState(
          () {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final CategoryItemModel item = _fetchResult.removeAt(oldIndex);
            _fetchResult.insert(newIndex, item);
          },
        );
      },
    );
  }
}

class ListItem extends ConsumerWidget {
  final CategoryItemModel item;
  const ListItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      key: key,
      elevation: 10,
      margin: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 15.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      clipBehavior: Clip.hardEdge,
      child: Slidable(
        key: key,
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          // dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              autoClose: true,
              borderRadius: BorderRadius.circular(10.r),
              onPressed: (newContext) async {
                showModalMethod() async {
                  final confirm = await showConfirmationDialog(
                      newContext, 'Sure?', "Are you sure to delete?");
                  return confirm;
                }

                bool accepted =
                    await showModalMethod().then((bool value) async {
                  if (item.password != null && value == true) {
                    bool isCorrectPass =
                        await passwordEnterModal(context, item.password!);
                    if (!isCorrectPass) return false;
                  }
                  return value;
                });
                if (!accepted) return;

                bool isSuccess = true;
                final CategoryItemsDataService serviceLayerClass =
                    CategoryItemsDataService();
                await EasyLoading.show(
                  status: 'loading...',
                );
                await serviceLayerClass.deleteCategory(item,
                    onError: () async => isSuccess = false);
                await EasyLoading.dismiss();
                if (!isSuccess) {
                  await EasyLoading.showError('Failed to delete');
                }
              },
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),

        // The end action pane is the one at the right or the bottom side.
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              autoClose: true,
              borderRadius: BorderRadius.circular(10.r),
              onPressed: (BuildContext context) => {
                ref.read(selectedGeneralItemProvider.notifier).state = item,
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return const ManageCategoryModal();
                  },
                ),
              },
              backgroundColor: const Color(0xFF0392CF),
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'edit',
            ),
          ],
        ),
        child: ListTile(
          onTap: () async {
            bool redirectFlg = true;
            if (item.password != null) {
              redirectFlg = await passwordEnterModal(context, item.password!);
            }
            if (redirectFlg) {
              appLogNoStack.d("success on tap list tile");
            }
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          title: Padding(
            padding: EdgeInsets.only(bottom: 5.h),
            child: Text(
              item.title,
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.desc,
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              RichText(
                text: TextSpan(
                  text: 'On ',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: DateFormat('yyyy-MM-dd kk:mm')
                          .format(item.createdDate),
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
          isThreeLine: true,
          tileColor: Colors.white,
          trailing: IconButton(
            tooltip: (item.password ?? '').isNotEmpty
                ? 'Set to no password'
                : 'Set password',
            icon: Icon(
              (item.password ?? '').isNotEmpty
                  ? Icons.lock_outline
                  : Icons.lock_open,
            ),
            color: (item.password ?? '').isNotEmpty ? Colors.red : Colors.green,
            onPressed: () {
              ref.read(selectedGeneralItemProvider.notifier).state = item;
              showModalBottomSheet<void>(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return const ChangePassBottomSheet();
                },
              );
            },
            iconSize: 50.h,
          ),
        ),
      ),
    );
  }
}
