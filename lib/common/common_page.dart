import 'package:flutter/material.dart';

///通用页面封装
abstract class CommonPage extends StatelessWidget {
  final Color? backgroundColor;
  bool canPop = true;

  CommonPage({super.key, this.backgroundColor, this.canPop = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar(),
      appBar: appBar(context),
      body: PopScope(
        canPop: canPop,
        onPopInvokedWithResult: (c, p) {
          onPopInvokedWithResult(context, c, p);
        },
        child: SafeArea(top: false, bottom: false, child: buildBody(context)),
      ),
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset(),
    );
  }

  bool extendBodyBehindAppBar() {
    return false;
  }

  bool? resizeToAvoidBottomInset() {
    return null;
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
