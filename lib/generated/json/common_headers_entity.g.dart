import 'package:mh_base/generated/json/base/json_convert_content.dart';
import 'package:mh_base/http/model/base/common_headers_entity.dart';

CommonHeadersEntity $CommonHeadersEntityFromJson(Map<String, dynamic> json) {
  final CommonHeadersEntity commonHeadersEntity = CommonHeadersEntity();
  final String? platform = jsonConvert.convert<String>(json['platform']);
  if (platform != null) {
    commonHeadersEntity.platform = platform;
  }
  final String? authorization = jsonConvert.convert<String>(
      json['authorization']);
  if (authorization != null) {
    commonHeadersEntity.authorization = authorization;
  }
  final String? uid = jsonConvert.convert<String>(json['uid']);
  if (uid != null) {
    commonHeadersEntity.uid = uid;
  }
  return commonHeadersEntity;
}

Map<String, dynamic> $CommonHeadersEntityToJson(CommonHeadersEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['platform'] = entity.platform;
  data['authorization'] = entity.authorization;
  data['uid'] = entity.uid;
  return data;
}

extension CommonHeadersEntityExtension on CommonHeadersEntity {
  CommonHeadersEntity copyWith({
    String? platform,
    String? authorization,
    String? uid,
  }) {
    return CommonHeadersEntity()
      ..platform = platform ?? this.platform
      ..authorization = authorization ?? this.authorization
      ..uid = uid ?? this.uid;
  }
}