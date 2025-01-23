import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/contract_payment_status_resp_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ContractPaymentStatusRespEntity {
  int? contractStatus = 0;

  ContractPaymentStatusRespEntity();

  factory ContractPaymentStatusRespEntity.fromJson(Map<String, dynamic> json) =>
      $ContractPaymentStatusRespEntityFromJson(json);

  Map<String, dynamic> toJson() => $ContractPaymentStatusRespEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
