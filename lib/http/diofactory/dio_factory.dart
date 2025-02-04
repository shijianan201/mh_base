import 'package:dio/dio.dart';

abstract class DioFactory {
  Dio createDio();

  String getBaseUrl() {
    return "";
  }
}
