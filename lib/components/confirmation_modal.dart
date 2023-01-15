import 'package:flutter/material.dart';
import 'package:store_it/components/common_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<bool> showConfirmationDialog(
    BuildContext context, String title, String desc) async {
  bool confirmed = false;
  await showDialog(
    context: context,
    builder: (BuildContext childContext) {
      return AlertDialog(
        title: Text(title),
        content: Text(desc),
        actions: <Widget>[
          ElevatedButton(
            style: raisedButtonStyle(Colors.red),
            onPressed: () => Navigator.of(childContext).pop(true),
            child: Text(
              'Yes',
              style: TextStyle(fontSize: 20.sp, color: Colors.white),
            ),
          ),
          ElevatedButton(
            style: raisedButtonStyle(Colors.white),
            onPressed: () => Navigator.of(childContext).pop(false),
            child: Text(
              'No',
              style: TextStyle(fontSize: 20.sp, color: Colors.red),
            ),
          ),
        ],
      );
    },
  ).then((value) => confirmed = value);
  return confirmed;
}
