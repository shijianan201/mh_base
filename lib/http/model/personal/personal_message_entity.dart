import 'package:landlord_mtech/base/util/text_util.dart';
import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/personal_message_entity.g.dart';
import 'dart:convert';

import '../../../../global/enums/push_message_type.dart';
import '../../../../landlord/notification/model/personal_invite_manage_house_entity.dart';
import '../../../../landlord/notification/model/text_message_entity.dart';

@JsonSerializable()
class PersonalMessageEntity {
  @JSONField(name: "_id")
  String? sId = '';
  String? chatRoomId = '';
  int? fromType = 0;
  String? fromId = '';
  String? fromName = '';
  String? fromAvatar = '';
  String? toId = '';
  String? roomId = '';
  String? toName = '';
  String? toAvatar = '';
  int? msgType = 0;
  String? sendTime = '';
  String? content = '';
  int? status = 0;
  String? createdAt = '';
  String? updatedAt = '';

  PersonalMessageEntity();

  factory PersonalMessageEntity.fromJson(Map<String, dynamic> json) =>
      $PersonalMessageEntityFromJson(json);

  Map<String, dynamic> toJson() => $PersonalMessageEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  T? mapContent<T>() {
    if (content.isNullOrEmpty()) {
      return null;
    }
    PushMessageType? messageType = PushMessageType.fromIntCode(msgType);
    if (messageType == null) {
      return null;
    } else {
      try {
        switch (messageType) {
          case PushMessageType.text:
          case PushMessageType.personalText:
            return TextMessageEntity.fromJson(jsonDecode(content!)) as T;
          case PushMessageType.personalInvite2ManageHouse:
            return PersonalInviteManageHouseEntity.fromJson(
                jsonDecode(content!)) as T;
          default:
            return null;
        }
      } catch (e) {
        return null;
      }
    }
  }
}
