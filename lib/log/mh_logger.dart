import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

void logD(dynamic message,
    {DateTime? time, Object? error, StackTrace? stackTrace}) {
  MhLogger.d(message, time: time, error: error, stackTrace: stackTrace);
}

void logE(dynamic message,
    {DateTime? time, Object? error, StackTrace? stackTrace}) {
  MhLogger.e(message, time: time, error: error, stackTrace: stackTrace);
}

class MhLogger {
  static final _logger = Logger(
      printer: PrettyPrinter(
          methodCount: 2,
          errorMethodCount: 0,
          lineLength: 120,
          colors: true,
          printEmojis: true,
          dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart),
      filter: _MhLogFilter());

  static void d(dynamic message,
      {DateTime? time, Object? error, StackTrace? stackTrace}) {
    _logger.d(message, time: time, error: error, stackTrace: stackTrace);
  }

  static void e(dynamic message,
      {DateTime? time, Object? error, StackTrace? stackTrace}) {
    _logger.e(message, time: time, error: error, stackTrace: stackTrace);
  }
}

class _MhLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return kProfileMode || kDebugMode;
  }
}

extension StringLogExt on String? {
  logD() {}
}
