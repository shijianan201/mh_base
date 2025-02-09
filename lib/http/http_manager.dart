import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mh_base/http/service/http_service.dart';
import 'package:mh_base/log/mh_logger.dart';

import 'diofactory/dio_factory.dart';
import 'model/base/common_headers_entity.dart';

class HttpUserInfo{
  final String uid;
  final String authorization;

  HttpUserInfo(this.authorization, {required this.uid});
}

class HttpManager {
  static bool hasInit = false;
  static HashMap<String, Dio> dioCache = HashMap();
  static HashMap<String, HttpService> serviceCache = HashMap();
  static HttpUserInfo? userInfo;

  static void init(HashSet<HttpService> serviceSets) {
    assert(!hasInit);
    for (var element in serviceSets) {
      serviceCache[element.runtimeType.toString()] = element;
    }
    hasInit = true;
  }

  static void registerHost(String host, DioFactory factory) {
    assert(!hasInit);
    if (dioCache.containsKey(host)) {
      return;
    }
    dioCache.putIfAbsent(host, () => factory.createDio());
  }

  static void bindUser(HttpUserInfo userInfo){
    HttpManager.userInfo = userInfo;
    logD("http bind user uid = ${userInfo.uid}, auth = ${userInfo.authorization}");
  }

  static Dio getDio(String host) {
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
    CommonHeadersEntity commonHeadersEntity = CommonHeadersEntity();
    commonHeadersEntity.authorization = "Bearer ${userInfo?.authorization}";
    commonHeadersEntity.platform = platform;
    commonHeadersEntity.uid = userInfo?.uid ?? "";
    return commonHeadersEntity.toJson();
  }
}
