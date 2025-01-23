import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_house_details_entity.g.dart';
import 'dart:convert';

import '../../../base/http/model/landlord_room_detail_entity.dart';

@JsonSerializable()
class LandlordHouseDetailsEntity {
  String? id = '';
  String? houseName = '';
  String? houseAddress = '';
  String? houseUrl = '';
  List<LandlordHouseDetailsFloors>? floors;

  LandlordHouseDetailsEntity();

  factory LandlordHouseDetailsEntity.fromJson(Map<String, dynamic> json) =>
      $LandlordHouseDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => $LandlordHouseDetailsEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LandlordHouseDetailsFloors {
  int? floor = 0;
  List<LandlordRoomDetailEntity> rooms = [];

  LandlordHouseDetailsFloors();

  factory LandlordHouseDetailsFloors.fromJson(Map<String, dynamic> json) =>
      $LandlordHouseDetailsFloorsFromJson(json);

  Map<String, dynamic> toJson() => $LandlordHouseDetailsFloorsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
