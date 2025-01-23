import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/notification_chat_room_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class NotificationChatRoomEntity {
  @JSONField(name: "_id")
  String? sId = '';
  @JSONField(name: "user_id")
  String? userId = '';
  @JSONField(name: "friend_id")
  String? friendId = '';
  String? roomId = '';
  int? contractType;
  String? roomInfo = '';
  @JSONField(name: "show_date")
  String? showDate = '';
  String? createdAt = '';
  String? updatedAt = '';
  String? tenantName = '';
  String? tenantPhoneNumber = '';
  String? houseName;
  String? roomNumber;

  NotificationChatRoomEntity();

  factory NotificationChatRoomEntity.fromJson(Map<String, dynamic> json) =>
      $NotificationChatRoomEntityFromJson(json);

  Map<String, dynamic> toJson() => $NotificationChatRoomEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
