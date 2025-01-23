import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/tenant_bill_detail_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TenantBillDetailEntity {
  late String startTime;
  late double rent;
  late double electricityUsage;
  late double electricityBill;
  late int paymentStatus;
  late String paymentSuccessTime;
  late String paymentAccount;
  late String paymentTypeDesc;
  @JSONField(name: "_id")
  late String sId;
  int electricityType = 0;
  int? collectionDay;

  TenantBillDetailEntity();

  factory TenantBillDetailEntity.fromJson(Map<String, dynamic> json) =>
      $TenantBillDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $TenantBillDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
