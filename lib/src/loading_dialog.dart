import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  static bool loaderShown = false;

  static void show(BuildContext context, {Key? key}) {
    loaderShown = true;
    showDialog<void>(
      context: context,
      useRootNavigator: true,
      barrierDismissible: true,
      builder: (_) => LoadingDialog(key: key),
    ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));
  }

  static void hide(BuildContext context) {
    if (loaderShown) {
      Navigator.of(context, rootNavigator: true).pop();
      loaderShown = false;
    }
  }

  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
