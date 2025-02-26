import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:mh_base/log/mh_logger.dart';

class RunUtil {
  static Future<T?> safeRun<T>(Future<T?> Function() runnable,
      {bool rethrowable = false}) async {
    try {
      return await runnable.call();
    } catch (e) {
      logD("safe run failed $e");
      if (rethrowable) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  static Future<T?> runAtNextFrameCome<T>(
      Future<T?> Function(Duration) runnable) async {
    Completer<T> completer = Completer();
    WidgetsBinding.instance.addPostFrameCallback((duration) async {
      var res = await safeRun<T>(() async {
        return await runnable.call(duration);
      });
      completer.complete(res);
    });
    return await completer.future;
  }
}
