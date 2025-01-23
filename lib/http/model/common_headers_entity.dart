import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/common_headers_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class CommonHeadersEntity {
  @JSONField(name: "Authorization")
  late String authorization;
  late String platform;
  late String uid;

  CommonHeadersEntity();

  factory CommonHeadersEntity.fromJson(Map<String, dynamic> json) =>
      $CommonHeadersEntityFromJson(json);

  Map<String, dynamic> toJson() => $CommonHeadersEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
