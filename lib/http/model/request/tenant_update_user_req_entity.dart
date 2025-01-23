import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/tenant_update_user_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TenantUpdateUserReqEntity {
  late String name;
  late String avatarUrl;

  TenantUpdateUserReqEntity();

  factory TenantUpdateUserReqEntity.fromJson(Map<String, dynamic> json) =>
      $TenantUpdateUserReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $TenantUpdateUserReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
