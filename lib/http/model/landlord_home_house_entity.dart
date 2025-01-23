import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_home_house_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordHomeHouseEntity {
  late String id;
  late String houseName;
  late String houseAddress;
  late String houseUrl;
  late int totalRoomNumber;
  late int rentedRoomNumber;
  bool isSelected=false;

  LandlordHomeHouseEntity();

  factory LandlordHomeHouseEntity.fromJson(Map<String, dynamic> json) =>
      $LandlordHomeHouseEntityFromJson(json);

  Map<String, dynamic> toJson() => $LandlordHomeHouseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
