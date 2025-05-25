import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MhLoading {
  static TransitionBuilder init() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
    return EasyLoading.init();
  }

  static void showLoading({
    String? status,
    Widget? indicator,
    EasyLoadingMaskType? maskType,
    bool? dismissOnTap,
  }) {
    EasyLoading.show(
        status: status,
        indicator: indicator,
        maskType: maskType,
        dismissOnTap: dismissOnTap);
  }

  static void hideLoading() {
    EasyLoading.dismiss();
  }

  static void showSuccess(
    String status, {
    Duration? duration,
    bool? dismissOnTap,
  }) {
    EasyLoading.showSuccess(
      status,
      dismissOnTap: dismissOnTap,
      duration: duration,
    );
  }
}
