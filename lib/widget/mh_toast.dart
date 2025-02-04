import 'package:fluttertoast/fluttertoast.dart';

void showShortToast(String? msg) {
  MhToast._show(msg, toastLength: Toast.LENGTH_SHORT);
}

void showLongToast(String? msg) {
  MhToast._show(msg, toastLength: Toast.LENGTH_LONG);
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
