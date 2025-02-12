import 'package:flutter/material.dart';

///通用页面封装
abstract class CommonPage extends StatelessWidget {
  final Color? backgroundColor;
  bool canPop = true;

  CommonPage({super.key, this.backgroundColor, this.canPop = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar(context),
      appBar: appBar(context),
      body: PopScope(
        canPop: canPop,
        onPopInvokedWithResult: (c, p) {
          onPopInvokedWithResult(context, c, p);
        },
        child: SafeArea(top: false, bottom: false, child: buildBody(context)),
      ),
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset(context),
    );
  }

  bool extendBodyBehindAppBar(BuildContext context) {
    return false;
  }

  bool? resizeToAvoidBottomInset(BuildContext context) {
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

  AppBar? getBackAppBar(BuildContext context,
      {String? title, bool showBack = true}) {
    return AppBar(
      leading: showBack
          ? InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: EdgeInsets.only(
                  left: 32,
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: Color(0xff333333),
                  size: 24,
                ),
              ),
            )
          : SizedBox(),
      leadingWidth: 56,
      title: Text(
        title ?? "",
        style: TextStyle(fontSize: 20, color: Color(0xFf333333)),
      ),
    );
  }
}
