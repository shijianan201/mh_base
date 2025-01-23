import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/tenant_update_electric_resp_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TenantUpdateElectricRespEntity {
  late String startTime;
  late String endTime;
  late String paymentDate;
  late int rent;
  late String depositInfo;
  late int electricityType;
  late int currentMeterReading;
  late int lastMeterReading;
  late double electricityUsage;
  late double electricityPrice;
  late double electricityBill;
  late int paymentStatus;
  late String paymentSuccessTime;
  late String paymentAccount;
  late int paymentType;
  late String paymentTypeDesc;
  late int totalMoney;
  late int billType;
  @JSONField(name: "_id")
  late String sId;
  late String contractId;
  late String landlordId;
  late String tenantId;
  late String createdAt;
  late String updatedAt;

  TenantUpdateElectricRespEntity();

  factory TenantUpdateElectricRespEntity.fromJson(Map<String, dynamic> json) =>
      $TenantUpdateElectricRespEntityFromJson(json);

  Map<String, dynamic> toJson() => $TenantUpdateElectricRespEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
