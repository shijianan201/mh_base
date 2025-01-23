import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:landlord_mtech/base/console_logger.dart';
import 'package:landlord_mtech/base/http/http_result.dart';
import 'package:landlord_mtech/base/http/model/app_upgrade_info_entity.dart';
import 'package:landlord_mtech/base/http/model/ios_fake_status_entity.dart';
import 'package:landlord_mtech/base/http/model/ios_fake_status_req_entity.dart';
import 'package:landlord_mtech/base/http/model/loading_config.dart';
import 'package:landlord_mtech/base/http/model/toast_config.dart';

import '../api_request_host.dart';
import '../http_method.dart';
import '../model/landlord_file_upload_res_entity.dart';
import '../model/landlord_multi_file_upload_res_entity.dart';
import 'api_response_service.dart';

class LandlordCommonService extends ApiResponseService {
  LandlordCommonService({required super.dio});

  void uploadFile(ApiRequestHost host, String filePath,
      {required ValueSetter<LandlordFileUploadResEntity> onSuccess,
      ValueChanged<dynamic>? onError}) async {
    String name = Random().nextInt(10000).toString() +
        DateTime.now().millisecondsSinceEpoch.toString() +
        filePath.substring(filePath.lastIndexOf("."));
    FormData formData = FormData.fromMap(
        {"file": await MultipartFile.fromFile(filePath, filename: name)});
    doRequest<LandlordFileUploadResEntity>(
        host, "/file/upload", HttpMethod.post,
        loadingConfig: LoadingConfig(),
        data: formData,
        onSuccess: onSuccess,
        onError: onError);
  }

  Future<HttpResult<LandlordFileUploadResEntity>> uploadFileSync(
    ApiRequestHost host,
    String filePath,
  ) async {
    String name = Random().nextInt(10000).toString() +
        DateTime.now().millisecondsSinceEpoch.toString() +
        filePath.substring(filePath.lastIndexOf("."));
    FormData formData = FormData.fromMap(
        {"file": await MultipartFile.fromFile(filePath, filename: name)});
    return doRequestSync<LandlordFileUploadResEntity>(
        host, "/file/upload", HttpMethod.post,
        loadingConfig: LoadingConfig(),
        options: Options(
            method: "post",
            receiveTimeout: const Duration(minutes: 5),
            sendTimeout: const Duration(minutes: 5)),
        data: formData);
  }

  void uploadMultiFile(
      ApiRequestHost host, List<String> fileList, LoadingConfig? loadingConfig,
      {required ValueSetter<LandlordMultiFileUploadResEntity> onSuccess,
      ValueChanged<dynamic>? onError}) async {
    if (fileList.isEmpty) {
      onSuccess.call(LandlordMultiFileUploadResEntity());
      return;
    }
    Log.d(fileList.join(","));
    List<MultipartFile> list = [];
    for (var element in fileList) {
      String name = Random().nextInt(10000).toString() +
          DateTime.now().millisecondsSinceEpoch.toString() +
          element.substring(element.lastIndexOf("."));
      MultipartFile file =
          await MultipartFile.fromFile(element, filename: name);
      list.add(file);
      Log.d("添加file成功");
    }
    Log.d(list.length);
    FormData formData = FormData.fromMap({"file": list});
    doRequest<LandlordMultiFileUploadResEntity>(
        host, "/file/uploads", HttpMethod.post,
        loadingConfig: loadingConfig,
        options: Options(
            method: "post",
            receiveTimeout: const Duration(minutes: 5),
            sendTimeout: const Duration(minutes: 5)),
        data: formData,
        onSuccess: onSuccess,
        onError: onError);
  }

  Future<HttpResult<LandlordMultiFileUploadResEntity>> uploadMultiFileSync(
    ApiRequestHost host,
    List<String> fileList,
    LoadingConfig? loadingConfig,
  ) async {
    List<MultipartFile> list = [];
    for (var element in fileList) {
      String name = Random().nextInt(10000).toString() +
          DateTime.now().millisecondsSinceEpoch.toString() +
          element.substring(element.lastIndexOf("."));
      MultipartFile file =
          await MultipartFile.fromFile(element, filename: name);
      list.add(file);
      Log.d("添加file成功");
    }
    FormData formData = FormData.fromMap({"file": list});
    return doRequestSync<LandlordMultiFileUploadResEntity>(
        host, "/file/uploads", HttpMethod.post,
        loadingConfig: loadingConfig,
        options: Options(
            method: "post",
            receiveTimeout: const Duration(minutes: 5),
            sendTimeout: const Duration(minutes: 5)),
        data: formData);
  }

  Future<HttpResult<IosFakeStatusEntity>> getIosFakeStatus(
      ApiRequestHost host, IosFakeStatusReqEntity req) {
    return doRequestSync<IosFakeStatusEntity>(
        host, "/common/getAuditStatus", HttpMethod.post,
        toastConfig: ToastConfig(enableToast: false), data: req.toJson());
  }

  Future<HttpResult<AppUpgradeInfoEntity>> getAppUpgradeInfo(
      ApiRequestHost host, IosFakeStatusReqEntity req) {
    return doRequestSync<AppUpgradeInfoEntity>(
        host, "/common/getUpdateApp", HttpMethod.post,
        data: req.toJson());
  }
}
