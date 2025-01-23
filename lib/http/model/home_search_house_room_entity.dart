import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/home_search_house_room_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class HomeSearchHouseRoomEntity {
  HomeSearchHouseRoomHouseId? houseId;
  List<HomeSearchHouseRoomRooms>? rooms;

  HomeSearchHouseRoomEntity();

  factory HomeSearchHouseRoomEntity.fromJson(Map<String, dynamic> json) =>
      $HomeSearchHouseRoomEntityFromJson(json);

  Map<String, dynamic> toJson() => $HomeSearchHouseRoomEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeSearchHouseRoomHouseId {
  String? houseUrl = '';
  @JSONField(name: "_id")
  String? sId = '';
  String? houseName = '';
  String? houseAddress = '';

  HomeSearchHouseRoomHouseId();

  factory HomeSearchHouseRoomHouseId.fromJson(Map<String, dynamic> json) =>
      $HomeSearchHouseRoomHouseIdFromJson(json);

  Map<String, dynamic> toJson() => $HomeSearchHouseRoomHouseIdToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeSearchHouseRoomRooms {
  int? status = 0;
  String? contractNO = '';
  String? description = '';
  List<HomeSearchHouseRoomRoomsFeatures>? features;
  HomeSearchHouseRoomRoomsRoomSize? roomSize;
  int? rent = 0;
  @JSONField(name: "_id")
  String? sId = '';
  String? roomNumber = '';
  HomeSearchHouseRoomRoomsHouseId? houseId;
  String? landlordId = '';
  int? floorNumber = 0;
  String? createdAt = '';
  String? updatedAt = '';
  List<String> pictures = [];

  HomeSearchHouseRoomRooms();

  factory HomeSearchHouseRoomRooms.fromJson(Map<String, dynamic> json) =>
      $HomeSearchHouseRoomRoomsFromJson(json);

  Map<String, dynamic> toJson() => $HomeSearchHouseRoomRoomsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeSearchHouseRoomRoomsFeatures {
  @JSONField(name: "_id")
  String? sId = '';
  String? feature;

  HomeSearchHouseRoomRoomsFeatures();

  factory HomeSearchHouseRoomRoomsFeatures.fromJson(
          Map<String, dynamic> json) =>
      $HomeSearchHouseRoomRoomsFeaturesFromJson(json);

  Map<String, dynamic> toJson() =>
      $HomeSearchHouseRoomRoomsFeaturesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeSearchHouseRoomRoomsRoomSize {
  @JSONField(name: "_id")
  String? sId = '';
  String? roomSize;

  HomeSearchHouseRoomRoomsRoomSize();

  factory HomeSearchHouseRoomRoomsRoomSize.fromJson(
          Map<String, dynamic> json) =>
      $HomeSearchHouseRoomRoomsRoomSizeFromJson(json);

  Map<String, dynamic> toJson() =>
      $HomeSearchHouseRoomRoomsRoomSizeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeSearchHouseRoomRoomsHouseId {
  String? houseUrl = '';
  @JSONField(name: "_id")
  String? sId = '';
  String? houseName = '';
  String? houseAddress = '';

  HomeSearchHouseRoomRoomsHouseId();

  factory HomeSearchHouseRoomRoomsHouseId.fromJson(Map<String, dynamic> json) =>
      $HomeSearchHouseRoomRoomsHouseIdFromJson(json);

  Map<String, dynamic> toJson() => $HomeSearchHouseRoomRoomsHouseIdToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
