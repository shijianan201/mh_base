import 'dart:math';

import 'package:landlord_mtech/base/http/model/landlord_room_detail_entity.dart';
import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_floor_info_by_id_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordFloorInfoByIdEntity {
  late String id;
  late String houseName;
  late String houseAddress;
  late String houseUrl;
  List<LandlordFloorInfoByIdFloors> floors = [];

  LandlordFloorInfoByIdEntity();

  factory LandlordFloorInfoByIdEntity.fromJson(Map<String, dynamic> json) =>
      $LandlordFloorInfoByIdEntityFromJson(json);

  Map<String, dynamic> toJson() => $LandlordFloorInfoByIdEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LandlordFloorInfoByIdFloors {
  late int floor;
  List<LandlordFloorInfoByIdFloorsRooms> rooms = [];

  LandlordFloorInfoByIdFloors();

  factory LandlordFloorInfoByIdFloors.fromJson(Map<String, dynamic> json) =>
      $LandlordFloorInfoByIdFloorsFromJson(json);

  Map<String, dynamic> toJson() => $LandlordFloorInfoByIdFloorsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LandlordFloorInfoByIdFloorsRooms {
  late int status;
  late String description;
  late List<LandlordFloorInfoByIdFloorsRoomsFeatures> features;
  late int rent;
  List<String> pictures = [];
  @JSONField(name: "_id")
  late String sId;
  late String roomNumber;
  late String houseId;
  late String landlordId;
  late int floorNumber;
  late String createdAt;
  late String updatedAt;

  LandlordFloorInfoByIdFloorsRooms();

  factory LandlordFloorInfoByIdFloorsRooms.fromJson(
          Map<String, dynamic> json) =>
      $LandlordFloorInfoByIdFloorsRoomsFromJson(json);

  Map<String, dynamic> toJson() =>
      $LandlordFloorInfoByIdFloorsRoomsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  String? getPicture() {
    if (pictures.isEmpty) {
      return null;
    } else {
      return pictures.first;
    }
  }

  LandlordRoomDetailEntity map2roomDetailEntity() {
    LandlordRoomDetailEntity entity = LandlordRoomDetailEntity();
    entity.status = status;
    entity.pictures = pictures;
    entity.description = description;
    entity.sId = sId;
    entity.roomNumber = roomNumber;
    entity.floorNumber = floorNumber;
    entity.landlordId = landlordId;
    return entity;
  }
}

@JsonSerializable()
class LandlordFloorInfoByIdFloorsRoomsFeatures {
  @JSONField(name: "_id")
  late String sId;
  late String feature;

  LandlordFloorInfoByIdFloorsRoomsFeatures();

  factory LandlordFloorInfoByIdFloorsRoomsFeatures.fromJson(
          Map<String, dynamic> json) =>
      $LandlordFloorInfoByIdFloorsRoomsFeaturesFromJson(json);

  Map<String, dynamic> toJson() =>
      $LandlordFloorInfoByIdFloorsRoomsFeaturesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
