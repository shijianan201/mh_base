import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_batch_edit_house_request_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordBatchEditHouseRequestEntity {
  late String houseId;
  late List<int> floors;
  late List<String> features;
  late List<String> pictures;
  late String roomSize;
  late int rent;
  late String description;
  String? roomNumber;

  LandlordBatchEditHouseRequestEntity();

  factory LandlordBatchEditHouseRequestEntity.fromJson(
          Map<String, dynamic> json) =>
      $LandlordBatchEditHouseRequestEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      $LandlordBatchEditHouseRequestEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
