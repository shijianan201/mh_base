import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/tenant_delete_bank_profile_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TenantDeleteBankProfileReqEntity {
  late int type;
  late String id;

  TenantDeleteBankProfileReqEntity();

  factory TenantDeleteBankProfileReqEntity.fromJson(
          Map<String, dynamic> json) =>
      $TenantDeleteBankProfileReqEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      $TenantDeleteBankProfileReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
