//通过分页返回的数据封装
import 'dart:convert';

import 'package:mh_base/http/model/pagination_response.dart';

import '../../../../../generated/json/base/json_convert_content.dart';

class PageResponse<T> {
  List<T> dataList = [];
  String? traceId;
  PaginationResponse? paginationResponse;

  PageResponse();

  factory PageResponse.fromJson(Map<String, dynamic> json) =>
      $PageResponseFromJson<T>(json);

  Map<String, dynamic> toJson() => $PageResponseToJson(this);
}

PageResponse<T> $PageResponseFromJson<T>(Map<String, dynamic> json) {
  final PageResponse<T> apiRespEntity = PageResponse<T>();
  dynamic pageRes = json['pagination'];
  if (pageRes is Map<String,dynamic>) {
    apiRespEntity.paginationResponse =
        PaginationResponse.fromJson(pageRes);
  }

  dynamic dataRes = json['list'];
  if (dataRes is List) {
    if (dataRes.isEmpty) {
      apiRespEntity.dataList = [];
    } else {
      final List<T?> data =
          dataRes.map((e) => JsonConvert.fromJsonAsT<T>(e)).toList();
      List<T> res = [];
      for (var element in data) {
        if (element != null) {
          res.add(element);
        }
      }
      if (res.isNotEmpty) {
        apiRespEntity.dataList = res;
      } else {
        apiRespEntity.dataList = [];
      }
    }
  } else {
    apiRespEntity.dataList = [];
  }
  return apiRespEntity;
}

Map<String, dynamic> $PageResponseToJson(PageResponse response) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['items'] = response.dataList.map((e) => jsonEncode(e)).toList();

  return data;
}
