import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/tenant_lock_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TenantLockReqEntity {
  String? lockId;
  String? roomId;
  String? newPassword;
  String? oldPassword;
  String? password;
  String? remark;
  String? startTime;
  String? endTime;
  String? nfcId;
  String? nfcName;
  int? unlockMode;

  TenantLockReqEntity();

  factory TenantLockReqEntity.fromJson(Map<String, dynamic> json) =>
      $TenantLockReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $TenantLockReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
