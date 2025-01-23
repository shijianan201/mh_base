import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:landlord_mtech/base/console_logger.dart';
import 'package:landlord_mtech/base/environment.dart';
import 'package:landlord_mtech/base/http/http_manager.dart';
import 'package:landlord_mtech/base/http/model/loading_config.dart';
import 'package:landlord_mtech/base/http/model/toast_config.dart';
import 'package:landlord_mtech/base/languages.dart';
import 'package:mh_base/log/mh_logger.dart';

import '../error/http_error.dart';
import '../http_manager.dart';
import '../model/loading_config.dart';
import '../model/toast_config.dart';

abstract class HttpService {
  final Dio dio;

  const HttpService({required this.dio});

  Future<dynamic> request(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      String? mockAssetsFilePath,
      LoadingConfig? loadingConfig,
      ToastConfig? toastConfig,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    if (loadingConfig != null) {
      EasyLoading.show(
          status: loadingConfig.message ?? Language.current().request_loading,
          dismissOnTap: loadingConfig.dismissOnTap);
    }
    try {
      if (Environment.mockEnabled() &&
          Environment.isDebug() &&
          mockAssetsFilePath != null) {
        String mockJson =
            await rootBundle.loadString(mockAssetsFilePath, cache: true);
        Map<String, dynamic> jsonResult = jsonDecode(mockJson);
        return jsonResult;
      } else {
        if (options != null) {
          if (options.headers != null) {
            options.headers?.addAll(HttpManager.getCommonHeaders());
          } else {
            options.headers = HttpManager.getCommonHeaders();
          }
        } else {
          options = Options(headers: HttpManager.getCommonHeaders());
        }
        Response response = await dio.request(path,
            data: data,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
            options: options,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress);
        if (response.statusCode == 200) {
          dynamic data = response.data;
          if (data == null) {
            return Future.error(
                HttpUnknownError(HttpUnknownErrorType.nullResponse));
          } else {
            return data;
          }
        }
        return Future.error(HttpError(
            response.statusCode, response.statusMessage, response.realUri));
      }
    } catch (error) {
      logD("請求失敗，直接失敗了，${error.toString()}");
      return Future.error(
          HttpUnknownError(HttpUnknownErrorType.dioError, error: error));
    }
  }
}
