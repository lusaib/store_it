import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_it/config/logger_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_it/providers/home_page_providers.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        backgroundColor: const Color.fromARGB(255, 107, 184, 247),
        appBar: AppBar(
          title: Text(
            'Items',
            style: TextStyle(
              fontSize: 30.sp,
            ),
          ),
          toolbarHeight: 40.h,
          backgroundColor: Colors.black,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50.r),
            ),
          ),
        ),
        body: Container(),
      ),
    );
  }
}
