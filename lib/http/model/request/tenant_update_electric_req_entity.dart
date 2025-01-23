import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/tenant_update_electric_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TenantUpdateElectricReqEntity {
  late int electricityType;
  late String contractId;
  late String billId;
  late double currentMeterReading;
  late double electricityUsage;
  late double electricityBill;

  TenantUpdateElectricReqEntity();

  factory TenantUpdateElectricReqEntity.fromJson(Map<String, dynamic> json) =>
      $TenantUpdateElectricReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $TenantUpdateElectricReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
