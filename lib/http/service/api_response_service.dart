import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:landlord_mtech/base/console_logger.dart';
import 'package:landlord_mtech/base/global.dart';
import 'package:landlord_mtech/base/http/api_request_host.dart';
import 'package:landlord_mtech/base/http/error/http_error.dart';
import 'package:landlord_mtech/base/http/http_method.dart';
import 'package:landlord_mtech/base/http/http_result.dart';
import 'package:landlord_mtech/base/http/service/http_service.dart';
import 'package:landlord_mtech/base/languages.dart';
import 'package:landlord_mtech/base/toast.dart';
import 'package:landlord_mtech/base/util/text_util.dart';
import 'package:landlord_mtech/common/user_manager.dart';

import '../error/api_error_code.dart';
import '../model/api_response.dart';
import '../model/loading_config.dart';
import '../model/toast_config.dart';

abstract class ApiResponseService extends HttpService {
  ApiResponseService({required super.dio});

  Future<HttpResult<T>> requestSync<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      String? mockAssetsFilePath,
      LoadingConfig? loadingConfig,
      ToastConfig? toastConfig,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      var res = await requestForApiResponse<T>(path,
          data: data,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          options: options,
          mockAssetsFilePath: mockAssetsFilePath,
          loadingConfig: loadingConfig,
          toastConfig: toastConfig,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      return HttpResult(true, res);
    } catch (e) {
      int? errorCode = null;
      String? errorMessage = null;
      if(e is ApiError){
        errorCode =  (e).serverCode;
        errorMessage = (e).serverMessage;
      }else if(e is HttpError){
        errorCode =  (e).statusCode;
        errorMessage =  (e).statusMessage;
      }else if(e is HttpUnknownError){
        errorCode =  -1;
        errorMessage = e.errorType.name;
      }else{
        errorCode =  null;
      }
      return HttpResult.getError(error: e,errorCode: errorCode,errorMessage: errorMessage);
    }
  }

  /// 同步请求数据
  Future<HttpResult<T>> doRequestSync<T>(
      ApiRequestHost? host, String path, HttpMethod method,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      LoadingConfig? loadingConfig,
      ToastConfig? toastConfig,
      String? mockAssetsFilePath,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    Options newOptions = Options(method: method.name);
    newOptions.copyWith(
        extra: options?.extra,
        sendTimeout: options?.sendTimeout,
        receiveTimeout: options?.receiveTimeout,
        method: options?.method,
        headers: options?.headers);
    try {
      return await requestSync<T>(path,
          data: data,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          options: newOptions,
          loadingConfig: loadingConfig,
          toastConfig: toastConfig,
          mockAssetsFilePath: mockAssetsFilePath,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
    } catch (e) {
      return HttpResult.getError(error: e);
    }
  }

  Future<T> requestForApiResponse<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      String? mockAssetsFilePath,
      LoadingConfig? loadingConfig,
      ToastConfig? toastConfig,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      Map<String, dynamic> res = await request(path,
          data: data,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          options: options,
          loadingConfig: loadingConfig,
          toastConfig: toastConfig,
          mockAssetsFilePath: mockAssetsFilePath,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      ApiResponse<T> response = ApiResponse.fromJson(res);
      if (response.isSuccess()) {
        if (toastConfig != null && toastConfig.enableToast) {
          String successMessage = toastConfig.successMessage ?? "";
          if (successMessage.isNotEmpty) {
            MToast.showShort(successMessage);
          }
        }
        EasyLoading.dismiss();
        if (response.data == null) {
          "請求成功,但是數據是null".logD();
          return Future.value();
        } else {
          return Future.value(response.data);
        }
      } else {
        ApiError apiError = response.getApiError();
        EasyLoading.dismiss();
        Log.e("請求失敗，${apiError.toString()}");
        if (response.code == ApiErrorCode.loginInvalid) {
          bool res = await UserManager.instance.clear(byUser: false);
          Log.d("清除用戶信息:$res");
          MToast.show(Language.current().toast_user_invalid);
          Global.navigate2login();
        }
        throw apiError;
      }
    } catch (error) {
      String? errorMessage = toastConfig?.errorMessage;
      if(error is ApiError){
        String? apiErrorMessage = error.serverMessage;
        errorMessage = toastConfig?.errorMessage ??
            (apiErrorMessage ?? Language.current().toast_request_failed("${error.serverCode}"));
      }
      if (toastConfig != null && !toastConfig.enableToast) {
        errorMessage = null;
      }
      if (!errorMessage.isNullOrEmpty()) {
        errorMessage.toast();
      }
      EasyLoading.dismiss();
      if(error is ApiError){
        rethrow;
      }else{
        throw HttpUnknownError(HttpUnknownErrorType.dioError, error: error);
      }
    }
  }

  Future<T> getForApiResponse<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      String? mockAssetsFilePath,
      LoadingConfig? loadingConfig,
      ToastConfig? toastConfig,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    Options getOptions = Options(method: "GET");
    getOptions.copyWith();
    try {
      return await requestForApiResponse(path,
          data: data,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          loadingConfig: loadingConfig,
          toastConfig: toastConfig,
          options: getOptions,
          mockAssetsFilePath: mockAssetsFilePath,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
    }catch(e){
      return Future.error(e);
    }
  }

  Future<T> postForApiResponse<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      String? mockAssetsFilePath,
      LoadingConfig? loadingConfig,
      ToastConfig? toastConfig,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    Options postOptions = Options(method: "POST");
    postOptions.copyWith(
      extra: options?.extra,
    );
    try {
      return await requestForApiResponse(path,
          data: data,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          loadingConfig: loadingConfig,
          toastConfig: toastConfig,
          options: postOptions,
          mockAssetsFilePath: mockAssetsFilePath,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
    }catch(e){
      return Future.error(e);
    }
  }

  Future<T> get<T>(String path, ApiRequestHost host,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      LoadingConfig? loadingConfig,
      ToastConfig? toastConfig,
      String? mockAssetsFilePath,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    Future<T> future = getForApiResponse(path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
        mockAssetsFilePath: mockAssetsFilePath,
        loadingConfig: loadingConfig,
        toastConfig: toastConfig,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
    host.registerRequest(future);
    return await future;
  }

  Future<T> post<T>(String path, ApiRequestHost host,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      LoadingConfig? loadingConfig,
      ToastConfig? toastConfig,
      String? mockAssetsFilePath,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    Future<T> future = postForApiResponse(path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
        mockAssetsFilePath: mockAssetsFilePath,
        loadingConfig: loadingConfig,
        toastConfig: toastConfig,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
    host.registerRequest(future);
    return await future;
  }

  void doRequest<T>(ApiRequestHost host, String path, HttpMethod method,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      LoadingConfig? loadingConfig,
      ToastConfig? toastConfig,
      String? mockAssetsFilePath,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      required ValueSetter<T> onSuccess,
      ValueChanged<dynamic>? onError}) {
    Future<T> future;
    switch (method) {
      case HttpMethod.post:
        future = post<T>(path, host,
            data: data,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
            options: options,
            loadingConfig: loadingConfig,
            toastConfig: toastConfig,
            mockAssetsFilePath: mockAssetsFilePath,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress);
        break;
      default:
        future = get<T>(path, host,
            data: data,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
            options: options,
            loadingConfig: loadingConfig,
            toastConfig: toastConfig,
            mockAssetsFilePath: mockAssetsFilePath,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress);
        break;
    }
    future.then((value) {
      onSuccess.call(value);
    }).catchError((error) {
      Log.d(error);
      onError?.call(error);
    });
  }
}
