import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/send_message_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class SendMessageReqEntity {
  String? chatRoomId = '';
  String? fromId = '';
  String? toId = '';
  int? msgType = 0;
  String? content = '';
  String? roomId = "";

  SendMessageReqEntity();

  factory SendMessageReqEntity.fromJson(Map<String, dynamic> json) =>
      $SendMessageReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $SendMessageReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
