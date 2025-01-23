import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/lock_delete_room_nfc_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LockDeleteRoomNfcReqEntity {
  String? lockId;
  String? nfcId;
  String? roomId;

  LockDeleteRoomNfcReqEntity();

  factory LockDeleteRoomNfcReqEntity.fromJson(Map<String, dynamic> json) =>
      $LockDeleteRoomNfcReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $LockDeleteRoomNfcReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
