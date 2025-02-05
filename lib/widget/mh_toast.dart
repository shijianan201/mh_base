import 'package:fluttertoast/fluttertoast.dart';

void showShortToast(String? msg) {
  MhToast._show(msg, toastLength: Toast.LENGTH_SHORT);
}

void showLongToast(String? msg) {
  MhToast._show(msg, toastLength: Toast.LENGTH_LONG);
}

extension StringToastExt on String? {
  void toast({bool shortMode = true}) {
    if (shortMode) {
      showShortToast(this);
    } else {
      showLongToast(this);
    }
  }
}

class MhToast {
  static Future<void>? _show(
    String? msg, {
    Toast? toastLength,
  }) {
    if (msg == null) {
      return null;
    }
    return Fluttertoast.showToast(msg: msg, toastLength: toastLength);
  }
}
