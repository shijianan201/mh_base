import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/urge_contract_pay_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class UrgeContractPayReqEntity {
  List<UrgeContractPayReqContractInfos>? contractInfos;

  UrgeContractPayReqEntity();

  factory UrgeContractPayReqEntity.fromJson(Map<String, dynamic> json) =>
      $UrgeContractPayReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $UrgeContractPayReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UrgeContractPayReqContractInfos {
  String? tenantId = '';
  String? contractId = '';

  UrgeContractPayReqContractInfos();

  factory UrgeContractPayReqContractInfos.fromJson(Map<String, dynamic> json) =>
      $UrgeContractPayReqContractInfosFromJson(json);

  Map<String, dynamic> toJson() => $UrgeContractPayReqContractInfosToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
