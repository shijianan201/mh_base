import 'package:landlord_mtech/base/http/model/landlord_room_detail_entity.dart';
import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_room_contract_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordRoomContractEntity {
  late int rent;
  late int deposit;
  late String depositInfo;
  late String collectionDay;
  late int electricityType;
  late int currentMeterReading;
  late int electricityPrice;
  late List<String> contractPictures;
  late String memo;
  late int authorizationStatus;
  late int contractStatus;
  @JSONField(name: "_id")
  late String sId;
  late String roomId;
  late String landlordId;
  late String houseId;
  late String tenantId;
  String? startTime;
  String? endTime;
  late int contractType;
  late String createdAt;
  late String updatedAt;
  LandlordRoomDetailEntity? roomInfo;
  int? renewContract;
  int? renewMonth;
  int? terminationStatus;
  String? terminationTime;

  LandlordRoomContractEntity();

  factory LandlordRoomContractEntity.fromJson(Map<String, dynamic> json) =>
      $LandlordRoomContractEntityFromJson(json);

  Map<String, dynamic> toJson() => $LandlordRoomContractEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
