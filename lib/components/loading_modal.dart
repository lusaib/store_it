import 'package:flutter/material.dart';

class LoadingDialog extends StatefulWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  LoadingDialogState createState() => LoadingDialogState();

  void showLoading(BuildContext context) {
    LoadingDialogState().showLoading();
  }

  void hideLoading(BuildContext context) {
    LoadingDialogState().hideLoading();
  }
}

class LoadingDialogState extends State<LoadingDialog> {
  bool _isLoading = false;

  void showLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  void hideLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return AlertDialog(
        content: Row(
          children: const [
            CircularProgressIndicator(),
            SizedBox(width: 10),
            Text("Loading"),
          ],
        ),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      );
    }
    return const SizedBox();
  }
}
