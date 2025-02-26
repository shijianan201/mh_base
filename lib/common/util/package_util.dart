

import 'package:package_info_plus/package_info_plus.dart';

class PackageUtil{

  static Future<String>? getPackageName() async {
    var packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.packageName;
  }

  static Future<String>? getVersion() async {
    var packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  static Future<String>? getBuildNumber() async {
    var packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

}