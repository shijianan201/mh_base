import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/tenant_get_electric_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TenantGetElectricReqEntity {
  late int electricityType;
  late String contractId;
  late String billId;

  TenantGetElectricReqEntity();

  factory TenantGetElectricReqEntity.fromJson(Map<String, dynamic> json) =>
      $TenantGetElectricReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $TenantGetElectricReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
