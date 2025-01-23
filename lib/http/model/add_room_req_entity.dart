import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/add_room_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class AddRoomReqEntity {
  String? roomNumber = '';
  String? houseId = '';
  String? landlordId = '';
  int? floorNumber = 0;
  List<String>? features;
  List<String>? pictures;
  String? roomSize;
  String? description = '';
  int? rent = 0;

  AddRoomReqEntity();

  factory AddRoomReqEntity.fromJson(Map<String, dynamic> json) =>
      $AddRoomReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $AddRoomReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
