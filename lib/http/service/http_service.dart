import 'package:dio/dio.dart';

import '../error/http_error.dart';
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
}
