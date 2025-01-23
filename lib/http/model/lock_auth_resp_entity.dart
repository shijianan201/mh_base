import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/lock_auth_resp_entity.g.dart';
import 'dart:convert';
export 'package:landlord_mtech/generated/json/lock_auth_resp_entity.g.dart';

@JsonSerializable()
class LockAuthRespEntity {
  String? accessKey = '';
  int? qrCodeType;

  LockAuthRespEntity();

  factory LockAuthRespEntity.fromJson(Map<String, dynamic> json) =>
      $LockAuthRespEntityFromJson(json);

  Map<String, dynamic> toJson() => $LockAuthRespEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
