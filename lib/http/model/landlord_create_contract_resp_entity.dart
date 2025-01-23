import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_create_contract_resp_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordCreateContractRespEntity {
  late int rent;
  late int deposit;
  late String depositInfo;
  late int collectionDay;
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
  late String startTime;
  late String endTime;
  late int contractType;
  late String createdAt;
  late String updatedAt;
  @JSONField(name: "__v")
  late int iV;
  late int qrCodeType;

  LandlordCreateContractRespEntity();

  factory LandlordCreateContractRespEntity.fromJson(
          Map<String, dynamic> json) =>
      $LandlordCreateContractRespEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      $LandlordCreateContractRespEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
