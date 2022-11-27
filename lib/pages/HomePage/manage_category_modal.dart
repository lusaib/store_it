import 'package:store_it/config/logger_config.dart';
import 'package:store_it/domain/HomePage/Models/CategoryItem/category_item_model.dart';
import 'package:store_it/providers/home_page_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManageCategoryModal extends ConsumerStatefulWidget {
  const ManageCategoryModal({Key? key}) : super(key: key);

  @override
  ManageCategoryModalState createState() => ManageCategoryModalState();
}

class ManageCategoryModalState extends ConsumerState<ManageCategoryModal> {
  CategoryItemModel? _categoryItemTemp;

  //form items
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descController;
  late TextEditingController _passwordController;
  bool _isPasswordRequired = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    //init controllers
    _titleController = TextEditingController();
    _descController = TextEditingController();
    _passwordController = TextEditingController();

    _categoryItemTemp = ref.read(selectedGeneralItemProvider);
    if (_categoryItemTemp != null) {
      _titleController.text = _categoryItemTemp!.title;
      _descController.text = _categoryItemTemp!.desc;
      _isPasswordRequired = _categoryItemTemp!.password == null ? false : true;
      _passwordController.text = _categoryItemTemp!.password ?? '';
    }
  }

  final TextStyle hintStyle = TextStyle(
    fontSize: 15.sp,
  );

  final TextStyle labelStyle = TextStyle(
    fontSize: 20.sp,
  );

  ButtonStyle raisedButtonStyle(Color color) => ElevatedButton.styleFrom(
        minimumSize: Size(50.w, 36.h),
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
        ),
      );

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
            TextFormField(
              decoration: InputDecoration(
                icon: const Icon(Icons.title),
                hintText: 'Enter the category title?',
                labelText: 'Title *',
                hintStyle: hintStyle,
                labelStyle: labelStyle,
              ),
              controller: _titleController,
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
              },
              autofocus: true,
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: const Icon(Icons.description),
                hintText: 'Enter the category description?',
                labelText: 'Description *',
                hintStyle: hintStyle,
                labelStyle: labelStyle,
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: _descController,
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
              },
              autofocus: true,
            ),
            SizedBox(
              height: 20.h,
            ),
            if (_categoryItemTemp == null) ...[
              SizedBox(
                height: 30.h,
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
                  controller: _passwordController,
                  validator: (String? value) {
                    RegExp regex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    if (value == null) {
                      return 'Please enter password';
                    } else if (value.isEmpty) {
                      return 'Please enter password';
                    } else {
                      if (!regex.hasMatch(value)) {
                        return 'Enter valid password';
                      } else {
                        return null;
                      }
                    }
                  },
                  autofocus: true,
                ),
              ],
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
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
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
