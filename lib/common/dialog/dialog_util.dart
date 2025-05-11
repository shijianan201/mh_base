import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

enum DateTimePickerLocale {
  en,
  zhCN,
  zhTW,
  jp;

  LocaleType get locale {
    switch (this) {
      case DateTimePickerLocale.en:
        return LocaleType.en;
      case DateTimePickerLocale.zhCN:
        return LocaleType.zh;
      case DateTimePickerLocale.zhTW:
        return LocaleType.tw;
      case DateTimePickerLocale.jp:
        return LocaleType.jp;
    }
  }
}

Future<DateTime?> showMHDatePicker({
  required BuildContext context,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
  DateTime? currentDate,
  DateTimePickerLocale locale = DateTimePickerLocale.zhTW,
}) async {
  var res = await DatePicker.showDatePicker(
    context,
    showTitleActions: true,
    minTime: firstDate,
    locale: locale.locale,
    maxTime: lastDate ?? DateTime.now().add(Duration(days: 365 * 50)),
    currentTime: currentDate ?? DateTime.now(),
  );
  return res;
}

Future<DateTime?> showMHTimePicker({
  required BuildContext context,
  bool enableSeconds = true,
  DateTime? currentTime,
  DateTimePickerLocale locale = DateTimePickerLocale.zhTW,
}) async {
  var res = await DatePicker.showTimePicker(context,
      showTitleActions: true,
      showSecondsColumn: enableSeconds,
      locale: locale.locale,
      currentTime: currentTime ?? DateTime.now());
  return res;
}
