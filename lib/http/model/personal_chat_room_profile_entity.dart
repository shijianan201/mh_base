import 'package:landlord_mtech/base/http/model/personal/personal_owner_info_entity.dart';
import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/personal_chat_room_profile_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class PersonalChatRoomProfileEntity {
  @JSONField(name: "_id")
  String? sId = '';
  PersonalOwnerInfoEntity? userId;
  PersonalOwnerInfoEntity? friendId;
  String? createdAt = '';
  String? updatedAt = '';

  PersonalChatRoomProfileEntity();

  factory PersonalChatRoomProfileEntity.fromJson(Map<String, dynamic> json) =>
      $PersonalChatRoomProfileEntityFromJson(json);

  Map<String, dynamic> toJson() => $PersonalChatRoomProfileEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
