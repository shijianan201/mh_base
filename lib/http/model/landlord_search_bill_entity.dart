import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_search_bill_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordSearchBillEntity {
  String? houseId = '';
  String? houseName = '';
  String? houseAddress = '';
  List<LandlordSearchBillBills>? bills;

  LandlordSearchBillEntity();

  factory LandlordSearchBillEntity.fromJson(Map<String, dynamic> json) =>
      $LandlordSearchBillEntityFromJson(json);

  Map<String, dynamic> toJson() => $LandlordSearchBillEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LandlordSearchBillBills {
  String? contractId = '';
  String? landlordId = '';
  String? roomId = '';
  String? roomNumber = '';
  String? lockId = '';
  int? lockStatus = 0;
  int? collectionDay = 0;
  bool? isOverdue = false;
  int? overduePayment = 0;
  int? rent = 0;
  String? paymentDate = '';
  String? startTime = '';
  String? billId = '';
  int? overdueTime = 0;
  String? userName = '';
  List<String> pictures = [];
  String? tenantId = '';

  LandlordSearchBillBills();

  factory LandlordSearchBillBills.fromJson(Map<String, dynamic> json) =>
      $LandlordSearchBillBillsFromJson(json);

  Map<String, dynamic> toJson() => $LandlordSearchBillBillsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
