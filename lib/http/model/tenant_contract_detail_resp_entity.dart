import 'package:landlord_mtech/base/http/model/tenant_contract_info_entity.dart';
import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/tenant_contract_detail_resp_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TenantContractDetailRespEntity {
  List<String>? bills;
  TenantContractInfoEntity? contract;

  TenantContractDetailRespEntity();

  factory TenantContractDetailRespEntity.fromJson(Map<String, dynamic> json) =>
      $TenantContractDetailRespEntityFromJson(json);

  Map<String, dynamic> toJson() => $TenantContractDetailRespEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
