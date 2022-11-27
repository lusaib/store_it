import 'package:store_it/components/common_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<bool> passwordEnterModal(BuildContext context, String password) async {
  String passEntered = '';
  bool isError = false;
  String errorMsg = '';
  bool retValue = false;
  return showDialog<bool>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: <bool>(BuildContext context) {
      return AlertDialog(
        actionsPadding: EdgeInsets.only(right: 20.w, bottom: 10.h),
        backgroundColor: Colors.yellow[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        title: Text(
          'Enter the password',
          style: modalHeadingStyle,
        ),
        content: StatefulBuilder(
          builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.password),
                      hintText: 'Enter password ',
                      labelText: 'Password *',
                      hintStyle: hintStyle,
                      labelStyle: labelStyle,
                      errorText: isError ? errorMsg : null,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    // controller: _passwordController,
                    onChanged: (value) {
                      if (value != password) {
                        setState(() {
                          errorMsg = 'Enter valid password';
                          isError = true;
                        });
                      } else {
                        setState(() {
                          errorMsg = '';
                          isError = false;
                        });
                      }
                      setState(() {
                        passEntered = value;
                      });
                    },
                    autofocus: true,
                  ),
                ],
              ),
            );
          },
        ),
        actions: <Widget>[
          ElevatedButton(
            style: raisedButtonStyle(Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: TextStyle(fontSize: 20.sp, color: Colors.black),
            ),
          ),
          ElevatedButton(
            style: raisedButtonStyle(Colors.green),
            onPressed: () {
              if (passEntered == password) {
                retValue = true;
                Navigator.pop(context);
              }
            },
            child: Text(
              'Save',
              style: TextStyle(fontSize: 20.sp, color: Colors.black),
            ),
          )
        ],
      );
    },
  ).then((valueFromDialog) {
    return retValue;
  });
}
