import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/tenant_home_contract_info_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TenantHomeContractInfoEntity {
  late String contractId;
  late String roomId;
  late String landlordId;
  late String houseName;
  late String houseAddress;
  late String roomNumber;
  late String houseId;
  late int unReadMessageCount;
  String? lockId;
  String? lockDevicePwd;
  int? contractType;
  int? collectionDay;
  int? payMsg;
  int? repairMsg;
  int? newMsg;
  int electricityType = 0;

  TenantHomeContractInfoBills? bills;
  int? unlockMode;

  TenantHomeContractInfoEntity();

  factory TenantHomeContractInfoEntity.fromJson(Map<String, dynamic> json) =>
      $TenantHomeContractInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $TenantHomeContractInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TenantHomeContractInfoBills {
  late String contractId;
  late String billId;
  late String startTime;
  late String paymentDate;
  late double rent;
  int electricityType = 0;
  double? electricityBill;
  double? electricityUsage;
  bool? isOverdue = false;
  double? overduePayment;

  TenantHomeContractInfoBills();

  factory TenantHomeContractInfoBills.fromJson(Map<String, dynamic> json) =>
      $TenantHomeContractInfoBillsFromJson(json);

  Map<String, dynamic> toJson() => $TenantHomeContractInfoBillsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
