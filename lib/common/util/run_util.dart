import 'package:mh_base/log/mh_logger.dart';

class RunUtil {
  static Future<T?> safeRun<T>(Future<T> Function() runnable,
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
}
