import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_edit_room_request_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordEditRoomRequestEntity {
  late String roomId;
  late String description;
  late List<String> features;
  late String roomSize;
  late int status;
  late int rent;
  late List<String> pictures;
  String? roomNumber;

  LandlordEditRoomRequestEntity();

  factory LandlordEditRoomRequestEntity.fromJson(Map<String, dynamic> json) =>
      $LandlordEditRoomRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => $LandlordEditRoomRequestEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
