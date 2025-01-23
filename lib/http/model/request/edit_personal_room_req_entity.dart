import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/edit_personal_room_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class EditPersonalRoomReqEntity {
  String? roomId;
  String? roomName = '';
  String? description = '';
  String? houseId;
  List<String>? pictures;

  EditPersonalRoomReqEntity();

  factory EditPersonalRoomReqEntity.fromJson(Map<String, dynamic> json) =>
      $EditPersonalRoomReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $EditPersonalRoomReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
