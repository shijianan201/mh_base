//通过分页返回的数据封装
import 'dart:convert';

import '../../../../../generated/json/base/json_convert_content.dart';

class PageResponse<T> {
  bool hasNext = false;
  int page = 1;
  int total = 0;
  List<T> dataList = [];
  String? traceId;
  PageResponse();

  factory PageResponse.fromJson(Map<String, dynamic> json) =>
      $PageResponseFromJson<T>(json);

  Map<String, dynamic> toJson() => $PageResponseToJson(this);
}

PageResponse<T> $PageResponseFromJson<T>(Map<String, dynamic> json) {
  final PageResponse<T> apiRespEntity = PageResponse<T>();
  final int? page = jsonConvert.convert<int>(json['page']);
  if (page != null) {
    apiRespEntity.page = page;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    apiRespEntity.total = total;
  }

  final bool? hasNext = jsonConvert.convert<bool>(json['has_next']);
  if (hasNext != null) {
    apiRespEntity.hasNext = hasNext;
  }

  dynamic dataRes = json['items'];
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
  data['hasNext'] = response.hasNext;
  data['page'] = response.page;
  data['total'] = response.total;
  data['items'] = response.dataList.map((e) => jsonEncode(e)).toList();

  return data;
}
