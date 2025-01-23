import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_create_floors_request_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordCreateFloorsRequestEntity {
  late List<LandlordCreateFloorsRequestFloorsInfo> floorsInfo;

  LandlordCreateFloorsRequestEntity();

  factory LandlordCreateFloorsRequestEntity.fromJson(
          Map<String, dynamic> json) =>
      $LandlordCreateFloorsRequestEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      $LandlordCreateFloorsRequestEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LandlordCreateFloorsRequestFloorsInfo {
  late String houseName;
  late String houseAddress;
  String? houseUrl;
  late List<LandlordCreateFloorsRequestFloorsInfoFloors> floors;
  List<String> features = [];
  String? roomSize;

  LandlordCreateFloorsRequestFloorsInfo();

  factory LandlordCreateFloorsRequestFloorsInfo.fromJson(
          Map<String, dynamic> json) =>
      $LandlordCreateFloorsRequestFloorsInfoFromJson(json);

  Map<String, dynamic> toJson() =>
      $LandlordCreateFloorsRequestFloorsInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LandlordCreateFloorsRequestFloorsInfoFloors {
  late int floor;
  late List<LandlordCreateFloorsRequestFloorsInfoFloorsRooms> rooms;

  LandlordCreateFloorsRequestFloorsInfoFloors();

  factory LandlordCreateFloorsRequestFloorsInfoFloors.fromJson(
          Map<String, dynamic> json) =>
      $LandlordCreateFloorsRequestFloorsInfoFloorsFromJson(json);

  Map<String, dynamic> toJson() =>
      $LandlordCreateFloorsRequestFloorsInfoFloorsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LandlordCreateFloorsRequestFloorsInfoFloorsRooms {
  late String roomNumber;

  LandlordCreateFloorsRequestFloorsInfoFloorsRooms();

  factory LandlordCreateFloorsRequestFloorsInfoFloorsRooms.fromJson(
          Map<String, dynamic> json) =>
      $LandlordCreateFloorsRequestFloorsInfoFloorsRoomsFromJson(json);

  Map<String, dynamic> toJson() =>
      $LandlordCreateFloorsRequestFloorsInfoFloorsRoomsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
