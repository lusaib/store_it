import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_it/config/logger_config.dart';
import 'package:store_it/pages/HomePage/category_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_it/pages/HomePage/manage_category_modal.dart';
import 'package:store_it/providers/home_page_providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        backgroundColor: const Color.fromARGB(255, 107, 184, 247),
        appBar: AppBar(
          leadingWidth: 100.w,
          leading: IconButton(
            icon: const Icon(
              Icons.add,
            ),
            color: Colors.yellow,
            padding: EdgeInsets.zero,
            onPressed: () => {
              ref.read(selectedGeneralItemProvider.notifier).state = null,
              showModalBottomSheet<void>(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return const ManageCategoryModal();
                },
              )
            },
            iconSize: 50.h,
          ),
          title: Text(
            'ItemList',
            style: TextStyle(
              fontSize: 30.sp,
            ),
          ),
          toolbarHeight: 130.h,
          backgroundColor: Colors.black,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50.r),
            ),
          ),
        ),
        body:
            // Padding(
            // padding: EdgeInsets.only(top: 20.h),
            // child:
            const CategoryItems(),
        // ),
      ),
    );
  }
}
