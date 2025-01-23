import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/push_item_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class PushNotificationItemEntity {
  int? type = 0;
  int? pushStatus = 0;
  String? pushTime = '';
  int? pushType = 0;
  int? pushUserType = 0;
  String? toId = '';
  String? fromId = '';
  String? roomId = '';
  String? chatRoomId = '';
  int? jumpType = 0;
  int? userReadStatus = 0;
  String? extras = '';
  @JSONField(name: "_id")
  String? sId = '';
  String? title = '';
  String? content = '';
  String? createdAt = '';
  String? updatedAt = '';

  PushNotificationItemEntity();

  factory PushNotificationItemEntity.fromJson(Map<String, dynamic> json) =>
      $PushNotificationItemEntityFromJson(json);

  Map<String, dynamic> toJson() => $PushNotificationItemEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  String getNotificationTypeTitle() {
    return "租約通知";
  }
}
