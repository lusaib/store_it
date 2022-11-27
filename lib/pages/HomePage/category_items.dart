import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:store_it/config/logger_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:store_it/domain/HomePage/Models/CategoryItem/category_item_model.dart';
import 'package:intl/intl.dart';
import 'package:store_it/pages/HomePage/change_pass_bottomsheet.dart';
import 'package:store_it/pages/HomePage/manage_category_modal.dart';
import 'package:store_it/pages/HomePage/password_enter_modal.dart';
import 'package:store_it/providers/home_page_providers.dart';
import 'dart:ui';

class CategoryItems extends ConsumerStatefulWidget {
  const CategoryItems({Key? key}) : super(key: key);

  @override
  CategoryItemsState createState() => CategoryItemsState();
}

class CategoryItemsState extends ConsumerState<CategoryItems> {
  final List<CategoryItemModel> _fetchResult = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchCategoryItems();
  }

  void fetchCategoryItems() async {
    try {
      var url = Uri.https('6370dda508218c267e078bb3.mockapi.io', 'category');
      var response = await http.get(url);
      appLogNoStack.d('Response status: ${response.statusCode}');
      appLogNoStack.d('Response body: ${response.body}');

      List resultData = json.decode(response.body)["items"];
      _fetchResult.clear();
      for (var element in resultData) {
        _fetchResult.add(CategoryItemModel.fromJson(element));
      }
      appLogNoStack.d(_fetchResult);
      setState(() {
        _fetchResult;
        loading = false;
      });
    } catch (err) {
      appLogNoStack.e(err.toString());
    }
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
          Card(
            key: Key('$index'),
            elevation: 10,
            margin: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 15.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            clipBehavior: Clip.hardEdge,
            child: Slidable(
              key: ValueKey('$index'),
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                // dismissible: DismissiblePane(onDismissed: () {}),
                children: [
                  SlidableAction(
                    autoClose: true,
                    borderRadius: BorderRadius.circular(10.r),
                    onPressed: (context) => {},
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
                      ref.read(selectedGeneralItemProvider.notifier).state =
                          _fetchResult[index],
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
                  if (_fetchResult[index].password != null) {
                    redirectFlg = await passwordEnterModal(
                        context, _fetchResult[index].password!);
                  }
                  if (redirectFlg) {
                    appLogNoStack.d("success on tap list tile");
                  }
                },
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                title: Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: Text(
                    _fetchResult[index].title,
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
                      _fetchResult[index].desc,
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
                            text: DateFormat('yyyy-MM-dd kk:mm').format(
                                _fetchResult[index].createdDate ??
                                    DateTime.now()),
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
                  tooltip: (_fetchResult[index].password ?? '').isNotEmpty
                      ? 'Set to no password'
                      : 'Set password',
                  icon: Icon(
                    (_fetchResult[index].password ?? '').isNotEmpty
                        ? Icons.lock_outline
                        : Icons.lock_open,
                  ),
                  color: (_fetchResult[index].password ?? '').isNotEmpty
                      ? Colors.red
                      : Colors.green,
                  onPressed: () {
                    ref.read(selectedGeneralItemProvider.notifier).state =
                        _fetchResult[index];
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
          ),
      ],
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final CategoryItemModel item = _fetchResult.removeAt(oldIndex);
          _fetchResult.insert(newIndex, item);
        });
      },
    );
  }
}
