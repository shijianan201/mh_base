import 'package:dio/dio.dart';

abstract class DioFactory {
  Dio createDio();

  String getBaseUrl() {
    late String res;
    switch (Environment.getApiEnvironment()) {
      case ApiEnvironment.dev:
        res = "http://10.181.62.161:3030";
        break;
      case ApiEnvironment.test:
        res = "http://47.243.229.10:3030";
        break;
      case ApiEnvironment.taiwan:
        res = "http://1.34.150.93:3031";
        break;
      case ApiEnvironment.product:
        res = "http://47.243.229.10:3031";
        break;
      case ApiEnvironment.localMock:
        res = "http://127.0.0.1:4523/m1/2784121-0-default";
        break;
      case ApiEnvironment.serverMock:
        res = "https://mock.apifox.cn/m1/2784121-0-default";
        break;
      default:
        //默認測試環境
        res = "http://47.243.229.10:3030";
        break;
    }
    return res;
  }
}
