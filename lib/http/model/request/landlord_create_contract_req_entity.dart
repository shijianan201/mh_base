import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_create_contract_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordCreateContractReqEntity {
  late String roomId;
  late String landlordId;
  late String houseId;
  late String tenantId;
  late String startTime;
  late String endTime;
  late int contractType;
  late double rent;
  late double deposit;
  late String depositInfo;
  late String collectionDay;
  late int electricityType;
  late int currentMeterReading;
  late double electricityPrice;
  late List<String> contractPictures;
  late String memo;
  late int authorizationStatus;
  late int contractStatus;
  late int rentalPeriod;

  LandlordCreateContractReqEntity();

  factory LandlordCreateContractReqEntity.fromJson(Map<String, dynamic> json) =>
      $LandlordCreateContractReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $LandlordCreateContractReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
