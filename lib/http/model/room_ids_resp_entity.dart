import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/room_ids_resp_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class RoomIdsRespEntity {
  List<RoomIdsRespRoomIds>? roomIds;

  RoomIdsRespEntity();

  factory RoomIdsRespEntity.fromJson(Map<String, dynamic> json) =>
      $RoomIdsRespEntityFromJson(json);

  Map<String, dynamic> toJson() => $RoomIdsRespEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RoomIdsRespRoomIds {
  @JSONField(name: "_id")
  String? sId = '';

  RoomIdsRespRoomIds();

  factory RoomIdsRespRoomIds.fromJson(Map<String, dynamic> json) =>
      $RoomIdsRespRoomIdsFromJson(json);

  Map<String, dynamic> toJson() => $RoomIdsRespRoomIdsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
