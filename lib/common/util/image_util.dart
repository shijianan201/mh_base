import 'dart:io';
import 'dart:typed_data';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:mh_base/common/util/invoke_result.dart';
import 'package:path_provider/path_provider.dart';

import '../permission/mh_permissions.dart';

class SaveImageRes {
  bool success = false;
  String? filePath;
  bool permissionPermanentlyDenied = false;

  SaveImageRes(this.success,
      {this.filePath, this.permissionPermanentlyDenied = false});
}

class ImageUtil {
  static Future<SaveImageRes> saveBytes2localSafely(
      BuildContext context, Uint8List source,
      {String? fileNamePrefix}) async {
    try {
      var dir = await getTemporaryDirectory();
      var name = fileNamePrefix != null
          ? "${fileNamePrefix}_${DateTime.now().millisecondsSinceEpoch}.png"
          : "${DateTime.now().millisecondsSinceEpoch}.png";
      var filePath = "${dir.path}/$name";
      var file = File(filePath);
      await file.writeAsBytes(source, flush: true);
      return SaveImageRes(true, filePath: filePath);
    } catch (e) {
      return SaveImageRes(false, permissionPermanentlyDenied: e is StateError);
    }
  }

  static Future<SaveImageRes> saveBytes2gallerySafely(
      BuildContext context, Uint8List source,
      {String? desc}) async {
    try {
      var path = await saveBytes2gallery(context, source, desc: desc);
      return SaveImageRes(true, filePath: path);
    } catch (e) {
      return SaveImageRes(false, permissionPermanentlyDenied: e is StateError);
    }
  }

  static Future<String?> saveBytes2gallery(
      BuildContext context, Uint8List source,
      {String? desc}) async {
    if (source.isEmpty) {
      throw "保存圖片失敗，圖片不存在";
    }
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    InvokeResult<PermissionRequestResult> photoStatus;
    PermissionDialogConfig config = PermissionDialogConfig(
        "保存圖片需要訪問圖庫",
        desc ??
            "請在APP->設置->權限裡允許訪問圖庫，否則無法保存圖片",
        positiveButtonText: "現在設置",
        negativeButtonText: "不允許");
    if (Platform.isIOS) {
      photoStatus = await PermissionsType.photos.check(
        context,
        permanentlyDeniedDialogConfig: config,
      );
    } else {
      var androidInfo = await deviceInfo.androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        photoStatus = await PermissionsType.photos.check(
          context,
          permanentlyDeniedDialogConfig: config,
        );
      } else {
        photoStatus = await PermissionsType.storage.check(
          context,
          permanentlyDeniedDialogConfig: config,
        );
      }
    }
    if (!photoStatus.success) {
      throw StateError("Save failed，photos permission leak");
    }
    await ImageGallerySaver.saveImage(source,name: "mh_lock_${DateTime.now().millisecondsSinceEpoch}.png");
  }
}
