import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/tenant_bill_info_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TenantBillInfoEntity {
  late String startTime;
  late String endTime;
  late String paymentDate;
  late double rent;
  late int electricityType;
  late int currentMeterReading;
  late double electricityPrice;
  double? electricityBill;
  late int paymentStatus;
  late String paymentSuccessTime;
  late String paymentAccount;
  late int paymentType;
  late String paymentTypeDesc;
  late double totalMoney;
  late int billType;
  @JSONField(name: "_id")
  late String sId;
  late String contractId;
  late String landlordId;
  late String tenantId;
  late String depositInfo;

  TenantBillInfoEntity();

  factory TenantBillInfoEntity.fromJson(Map<String, dynamic> json) =>
      $TenantBillInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $TenantBillInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
