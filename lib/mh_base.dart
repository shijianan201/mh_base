import 'package:flutter/foundation.dart';
import 'package:mh_base/log/mh_logger.dart';
import 'package:mh_base/widget/mh_loading.dart';

class MhBase {
  static Future<void> initEnvironment() async {
    logD(
        "kDebugMode = $kDebugMode,kProfileMode = $kProfileMode,kReleaseMode = $kReleaseMode");
    MhLoading.init();
    if(kDebugMode){

    }
  }
}
