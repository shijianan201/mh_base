import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/house_unread_message_item_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class HouseUnreadMessageItemEntity {
  int? landlordUnReadMsgCount = 0;
  @JSONField(name: "last_msg_type")
  String? lastMsgType = '';
  @JSONField(name: "last_msg")
  String? lastMsg = '';
  @JSONField(name: "_id")
  String? sId = '';
  @JSONField(name: "user_id")
  String? userId = '';
  @JSONField(name: "friend_id")
  String? friendId = '';
  String? roomId = '';
  String? houseId = '';
  String? contractType = '';
  String? houseName = '';
  String? roomNumber = '';
  String? tenantName = '';
  String? tenantPhoneNumber = '';
  String? tenantAvatar = '';
  String? updatedAt = '';
  String? sendTime = '';

  HouseUnreadMessageItemEntity();

  factory HouseUnreadMessageItemEntity.fromJson(Map<String, dynamic> json) =>
      $HouseUnreadMessageItemEntityFromJson(json);

  Map<String, dynamic> toJson() => $HouseUnreadMessageItemEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
