
import 'package:dio/dio.dart';
import 'package:mh_base/http/diofactory/dio_factory.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class BaseDioFactory extends DioFactory{

  @override
  Dio createDio() {
    Dio dio = Dio(BaseOptions(baseUrl: getBaseUrl()));
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