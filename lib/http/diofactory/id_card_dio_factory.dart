import 'package:dio/dio.dart';

import 'dio_factory.dart';

class IdCardDioFactory extends DioFactory {
  @override
  Dio createDio() {
    Dio dio = Dio(BaseOptions(
      baseUrl: "https://api.textin.com",
      receiveDataWhenStatusError: true,
    ));
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
