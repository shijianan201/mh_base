import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

import '../util/invoke_result.dart';

extension PermissionExt on PermissionsType {
  Future<InvokeResult<PermissionRequestResult>> check(BuildContext context,
      {PermissionDialogConfig? dialogConfig, //权限请求弹窗配置
      PermissionDialogConfig? permanentlyDeniedDialogConfig, //权限永久拒绝弹窗配置
      bool go2SettingsRequestPermanentlyDenied = false}) {
    return MhPermissions.checkPermission(context, this,
        dialogConfig: dialogConfig,
        permanentlyDeniedDialogConfig: permanentlyDeniedDialogConfig,
        go2SettingsRequestPermanentlyDenied:
            go2SettingsRequestPermanentlyDenied);
  }
}

enum PermissionsType {
  camera(Permission.camera),
  photos(Permission.photos),
  storage(Permission.storage),
  microphone(Permission.microphone),
  notification(Permission.notification);

  final Permission permission;

  const PermissionsType(this.permission);
}

class PermissionDialogConfig {
  final String? title;
  final String? message;
  final String? positiveButtonText;
  final String? negativeButtonText;

  PermissionDialogConfig(this.title, this.message,
      {this.positiveButtonText, this.negativeButtonText});
}

class PermissionRequestResult {
  final bool isGranted;
  final bool isPermanentlyDenied;

  PermissionRequestResult(this.isGranted, this.isPermanentlyDenied);
}

class MhPermissions {
  /// 是否正在请求权限
  static bool _isPermissionRequesting = false;

  static Future<PermissionStatus> getPermissionsState(
      PermissionsType type) async {
    PermissionStatus res = await type.permission.status;
    return res;
  }

  static Future<InvokeResult<PermissionRequestResult>> checkPermission(
      BuildContext context, PermissionsType permission,
      {PermissionDialogConfig? dialogConfig, //权限请求弹窗配置
      PermissionDialogConfig? permanentlyDeniedDialogConfig, //权限永久拒绝弹窗配置
      bool go2SettingsRequestPermanentlyDenied = false}) async {
    if (_isPermissionRequesting) {
      return InvokeResult(false,
          error: MessageError(
              message: "Another permission request is in progress"));
    }
    _isPermissionRequesting = true;
    var status = await permission.permission.status;
    if (status == PermissionStatus.granted) {
      _isPermissionRequesting = false;
      return InvokeResult(true, data: PermissionRequestResult(true, false));
    } else {
      if (status == PermissionStatus.permanentlyDenied ||
          (Platform.isIOS && status == PermissionStatus.limited)) {
        _isPermissionRequesting = false;
        if (permanentlyDeniedDialogConfig != null) {
          var res = await showOkCancelAlertDialog(
              context: context,
              title: permanentlyDeniedDialogConfig.title ?? "權限申請",
              message: permanentlyDeniedDialogConfig.message ??
                  "權限被永久拒絕，請前往APP設置頁面開啟權限",
              okLabel:
                  permanentlyDeniedDialogConfig.positiveButtonText ?? "前往設置",
              cancelLabel:
                  permanentlyDeniedDialogConfig.negativeButtonText ?? "取消",
              onPopInvokedWithResult: (a, b) {
                Navigator.of(context).pop(b);
              });
          if (res == OkCancelResult.ok) {
            openAppSettings(permission);
          }
        }
        return InvokeResult(false,
            error: MessageError(message: "Permission is permanently denied"));
      } else {
        Future<InvokeResult<PermissionRequestResult>> request() async {
          var res = await permission.permission.request();
          _isPermissionRequesting = false;
          if (res == PermissionStatus.granted) {
            return InvokeResult(true,
                data: PermissionRequestResult(true, false));
          } else {
            if (res == PermissionStatus.permanentlyDenied &&
                go2SettingsRequestPermanentlyDenied) {
              openAppSettings(permission);
            }
            return InvokeResult(false,
                error: MessageError(message: "User denied permission request"));
          }
        }

        if (dialogConfig != null) {
          var res = await showOkCancelAlertDialog(
              context: context,
              title: dialogConfig.title ?? "申請權限",
              message: dialogConfig.message ?? "接下來的操作需要申請權限，請允許APP獲取相關權限",
              okLabel: dialogConfig.positiveButtonText ?? "現在申請",
              cancelLabel: dialogConfig.negativeButtonText ?? "取消",
              onPopInvokedWithResult: (a, b) {
                Navigator.of(context).pop(b);
              });
          if (res == OkCancelResult.ok) {
            return await request();
          } else {
            _isPermissionRequesting = false;
            return InvokeResult(false,
                error:
                    MessageError(message: "User cancelled permission request"));
          }
        } else {
          return await request();
        }
      }
    }
  }

  static openAppSettings(PermissionsType type) async {
    await AppSettings.openAppSettings(type: AppSettingsType.settings);
  }
}
