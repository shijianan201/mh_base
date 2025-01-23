import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'dio_factory.dart';

class TestDioFactory extends DioFactory {
  @override
  Dio createDio() {
    Dio dio = Dio(BaseOptions(baseUrl: "https://api.github.com"));
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true));
    return dio;
  }
}
