import 'package:landlord_mtech/base/util/text_util.dart';
import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/notification_message_item_entity.g.dart';
import 'dart:convert';

import 'package:landlord_mtech/global/enums/push_message_type.dart';
import 'package:landlord_mtech/landlord/notification/model/erge_pay_message_entity.dart';
import 'package:landlord_mtech/landlord/notification/model/text_message_entity.dart';

import '../../../../landlord/notification/model/repair_message_entity_entity.dart';

@JsonSerializable()
class NotificationMessageItemEntity {
  @JSONField(name: "_id")
  String? sId = '';
  String? chatRoomId = '';
  int? fromType = 0;
  String? fromId = '';
  String? fromName = '';
  String? fromAvatar = '';
  String? toId = '';
  String? toName = '';
  String? toAvatar = '';
  int? msgType = 0;
  String? sendTime = '';
  String? content = '';
  int? status = 0;
  String? createdAt = '';
  String? updatedAt = '';

  NotificationMessageItemEntity();

  factory NotificationMessageItemEntity.fromJson(Map<String, dynamic> json) =>
      $NotificationMessageItemEntityFromJson(json);

  Map<String, dynamic> toJson() => $NotificationMessageItemEntityToJson(this);

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
          case PushMessageType.repair:
            return RepairMessageEntityEntity.fromJson(jsonDecode(content!))
                as T;
          case PushMessageType.text:
            return TextMessageEntity.fromJson(jsonDecode(content!)) as T;
          case PushMessageType.urgeContractPay:
            return ErgePayMessageEntity.fromJson(jsonDecode(content!)) as T;
          default:
            return null;
        }
      } catch (e) {
        return null;
      }
    }
  }
}
