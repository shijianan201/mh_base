import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mh_base/http/service/http_service.dart';

import 'diofactory/dio_factory.dart';
import 'model/common_headers_entity.dart';

enum HttpHost { test, landlord, tenant, textIn, personal }

class HttpManager {
  static bool hasInit = false;
  static HashMap<HttpHost, Dio> dioCache = HashMap();
  static HashMap<String, HttpService> serviceCache = HashMap();

  static void init(HashSet<HttpService> serviceSets) {
    assert(!hasInit);
    for (var element in serviceSets) {
      serviceCache[element.runtimeType.toString()] = element;
    }
    hasInit = true;
  }

  static void registerHost(HttpHost host, DioFactory factory) {
    assert(!hasInit);
    if (dioCache.containsKey(host)) {
      return;
    }
    dioCache.putIfAbsent(host, () => factory.createDio());
  }

  static Dio getDio(HttpHost host) {
    Dio? dio = dioCache[host];
    assert(dio != null);
    return dio!;
  }

  static T getService<T extends HttpService>() {
    String tStr = T.toString();
    HttpService? service = serviceCache[tStr];
    if (service != null) {
      return service as T;
    }
    throw "HttpService $tStr is null,please init in init function at main";
  }

  static Map<String, dynamic> getCommonHeaders() {
    String platform = "";
    if (Platform.isAndroid) {
      platform = "Android";
    }
    if (Platform.isIOS) {
      platform = "IOS";
    }
    String uid = "";
    String authorization = "";
    CommonHeadersEntity commonHeadersEntity = CommonHeadersEntity();
    commonHeadersEntity.authorization = "Bearer $authorization";
    commonHeadersEntity.platform = platform;
    commonHeadersEntity.uid = uid;
    return commonHeadersEntity.toJson();
  }
}
