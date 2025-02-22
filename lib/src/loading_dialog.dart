import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  static bool loaderShown = false;

  static void show(BuildContext context, {Key? key}) {
    if (!loaderShown) {
      loaderShown = true;
      showDialog<void>(
        context: context,
        useRootNavigator: true,
        barrierDismissible: true,
        builder: (_) => LoadingDialog(key: key),
      ).then((_) {
        if (context.mounted) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      });
    }
  }

  static void hide(BuildContext context) {
    if (loaderShown) {
      Navigator.of(context, rootNavigator: true).pop();
      loaderShown = false;
    }
  }

  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
