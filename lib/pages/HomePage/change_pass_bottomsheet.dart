import 'package:store_it/components/common_style.dart';
import 'package:store_it/config/logger_config.dart';
import 'package:store_it/domain/HomePage/Models/CategoryItem/category_item_model.dart';
import 'package:store_it/providers/home_page_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePassBottomSheet extends ConsumerStatefulWidget {
  const ChangePassBottomSheet({Key? key}) : super(key: key);

  @override
  ChangePassBottomSheetState createState() => ChangePassBottomSheetState();
}

class ChangePassBottomSheetState extends ConsumerState<ChangePassBottomSheet> {
  CategoryItemModel? _categoryItemTemp;

  //form items
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _oldPasswordController;
  late TextEditingController _newPasswordController;
  bool _isPasswordRequired = false;

  bool _disableCurrentPass = false;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _oldPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    //init controllers
    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();

    _categoryItemTemp = ref.read(selectedGeneralItemProvider);
    if (_categoryItemTemp != null) {
      _isPasswordRequired = _categoryItemTemp!.password == null ? true : false;
      _oldPasswordController.text = '';
      _newPasswordController.text = '';
      _disableCurrentPass = _categoryItemTemp?.password == null ? false : true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 30.h,
        left: 20.w,
        right: 20.w,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: BoxDecoration(
        color: Colors.yellow[100],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            if (_disableCurrentPass) ...[
              TextFormField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.password),
                  hintText: 'Enter the password?',
                  labelText: 'Password *',
                  hintStyle: hintStyle,
                  labelStyle: labelStyle,
                ),
                // readOnly: ,
                keyboardType: TextInputType.visiblePassword,
                controller: _oldPasswordController,
                autofocus: true,
                onChanged: (value) => _formKey.currentState!.validate(),
                validator: (value) {
                  if (value != _categoryItemTemp?.password &&
                      _categoryItemTemp?.password != null) {
                    return 'Please enter the old password !';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 25.h,
              ),
            ],
            SizedBox(
              height: 25.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    // fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: _isPasswordRequired,
                    onChanged: (bool? value) {
                      setState(() {
                        _isPasswordRequired = value!;
                      });
                    },
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "Require Password to open",
                    style: labelStyle,
                  ),
                ],
              ),
            ),
            if (_isPasswordRequired) ...[
              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.password),
                  hintText: 'Enter the password?',
                  labelText: 'Password *',
                  hintStyle: hintStyle,
                  labelStyle: labelStyle,
                ),
                keyboardType: TextInputType.visiblePassword,
                controller: _newPasswordController,
                validator: (String? value) {
                  RegExp regex = RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                  if (!_isPasswordRequired) {
                    return null;
                  } else if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  } else {
                    if (!regex.hasMatch(value)) {
                      return 'Must contain capital letters , numbers and special characters';
                    } else {
                      return null;
                    }
                  }
                },
                onChanged: (value) => _formKey.currentState!.validate(),
                autofocus: true,
              ),
            ],
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 60.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ElevatedButton(
                    style: raisedButtonStyle(Colors.white),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 20.sp, color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    style: raisedButtonStyle(Colors.green),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        appLogNoStack.d("Success change password");
                      }
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(fontSize: 20.sp, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
