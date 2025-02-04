import 'package:flutter/material.dart';

///通用页面封装
abstract class CommonPage extends StatelessWidget {
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  bool canPop = true;

  CommonPage(
      {super.key,
      this.backgroundColor,
      this.resizeToAvoidBottomInset,
      this.canPop = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: PopScope(
        canPop: canPop,
        onPopInvokedWithResult: (c, p) {
          onPopInvokedWithResult(context, c, p);
        },
        child: SafeArea(child: buildBody(context)),
      ),
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }

  void onPopInvokedWithResult(
      BuildContext context, bool didPop, dynamic result) {
    if (didPop) {
      Navigator.of(context).pop(result);
    }
  }

  Widget buildBody(BuildContext context);

  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }
}
