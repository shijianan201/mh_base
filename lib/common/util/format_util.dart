import 'package:date_format/date_format.dart';
import 'package:mh_base/common/util/text_util.dart';

class FormatUtil {
  static String format2date(DateTime dateTime, {String separator = '/'}) {
    return formatDate(dateTime, [yyyy, separator, mm, separator, dd]);
  }

  static String format2month(DateTime dateTime, {String separator = '/'}) {
    return formatDate(dateTime, [yyyy, separator, mm]);
  }

  static String format2time(DateTime dateTime,
      {String separator = ':', bool enableSeconds = true}) {
    return formatDate(
        dateTime,
        enableSeconds
            ? [HH, separator, nn, separator, ss]
            : [HH, separator, nn]);
  }

  static String format2dateTime(DateTime dateTime,
      {String dateSeparator = '/', String timeSeparator = ':'}) {
    return formatDate(dateTime, [
      yyyy,
      dateSeparator,
      mm,
      dateSeparator,
      dd,
      " ",
      HH,
      timeSeparator,
      nn,
      timeSeparator,
      ss
    ]);
  }

  static DateTime? format2dateTimeFromString(String? dateTimeString,
      {bool onlyTime = false}) {
    if (dateTimeString.isNullOrEmpty()) {
      return null;
    }
    try {
      if(onlyTime){
        var date = format2date(DateTime.now(),separator: "-");
        return DateTime.tryParse("$date ${dateTimeString!}");
      }else{
        return DateTime.tryParse(dateTimeString!);
      }
    } catch (e) {
      return null;
    }
  }

  static String? formatServer2month(String? dateTimeString,
      {String separator = '/'}) {
    var dateTime = format2dateTimeFromString(dateTimeString);
    if (dateTime == null) {
      return null;
    }
    return formatDate(dateTime, [yyyy, separator, mm]);
  }

  static String? formatServer2Date(String? dateTimeString,
      {String separator = '/'}) {
    var dateTime = format2dateTimeFromString(dateTimeString);
    if (dateTime == null) {
      return null;
    }
    return formatDate(dateTime, [yyyy, separator, mm, separator, dd]);
  }

  static String? formatServer2Datetime(String? dateTimeString,
      {String dateSeparator = '/', String timeSeparator = ':'}) {
    var dateTime = format2dateTimeFromString(dateTimeString);
    if (dateTime == null) {
      return null;
    }
    return formatDate(dateTime, [
      yyyy,
      dateSeparator,
      mm,
      dateSeparator,
      dd,
      " ",
      HH,
      timeSeparator,
      nn,
      timeSeparator,
      ss
    ]);
  }
}
