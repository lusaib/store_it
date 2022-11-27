import 'package:store_it/components/common_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        backgroundColor: const Color.fromARGB(255, 107, 184, 247),
        appBar: AppBar(
          title: Text(
            'Login',
            style: TextStyle(fontSize: 30.sp, color: Colors.black),
          ),
          // toolbarHeight: 130.h,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10.r),
            ),
          ),
        ),
        body: Center(
          child: SizedBox(
            width: 130.w,
            height: 50.h,
            child: ElevatedButton(
              style: raisedButtonStyle(const Color.fromARGB(255, 240, 86, 74)),
              onPressed: () => {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.login,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 25.sp, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Padding(
        // padding: EdgeInsets.only(top: 20.h),
        // child:
        // const CategoryItems(),
        // ),
      ),
    );
  }
}
