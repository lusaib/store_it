import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final TextStyle hintStyle = TextStyle(
  fontSize: 15.sp,
);

final TextStyle labelStyle = TextStyle(
  fontSize: 20.sp,
);

final TextStyle modalHeadingStyle = TextStyle(
  fontSize: 18.sp,
);

ButtonStyle raisedButtonStyle(Color color) => ElevatedButton.styleFrom(
      minimumSize: Size(50.w, 36.h),
      // maximumSize: Size(150.w, 50.h),
      backgroundColor: color,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
      ),
    );
