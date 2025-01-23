import 'dart:io';

import 'package:dio/dio.dart';
import 'package:landlord_mtech/base/console_logger.dart';
import 'package:landlord_mtech/base/environment.dart';
import 'package:landlord_mtech/base/http/http_manager.dart';
import 'package:landlord_mtech/base/http/interceptor/dio_header_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'dio_factory.dart';

class TenantDioFactory extends DioFactory {

  @override
  Dio createDio() {
    String baseUrl = getBaseUrl();
    Log.d("${runtimeType.toString()} 開始初始化，baseUrl = $baseUrl");
    Dio dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        headers: HttpManager.getCommonHeaders(),
        contentType: "application/json",
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10)));
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true));
    dio.interceptors.add(DioHeaderInterceptor());
    return dio;
  }
}
