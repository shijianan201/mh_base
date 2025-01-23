import 'package:flutter/foundation.dart';
import 'package:flutter_ume_plus/flutter_ume_plus.dart';
import 'package:flutter_ume/flutter_ume.dart'; // UME framework
import 'package:flutter_ume_kit_ui/flutter_ume_kit_ui.dart'; // UI kits
import 'package:flutter_ume_kit_perf/flutter_ume_kit_perf.dart'; // Performance kits
import 'package:flutter_ume_kit_show_code/flutter_ume_kit_show_code.dart'; // Show Code
import 'package:flutter_ume_kit_device/flutter_ume_kit_device.dart'; // Device info
import 'package:flutter_ume_kit_console/flutter_ume_kit_console.dart'; // Show debugPrint
import 'package:flutter_ume_kit_dio/flutter_ume_kit_dio.dart'; // Dio Inspector

class MhBase {
  static void initEnvironment() {
    if (kDebugMode) {}
  }
}
