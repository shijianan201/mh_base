import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/lock_modify_room_nfc_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LockModifyRoomNfcReqEntity {
  String? lockId;
  String? nfcId;
  String? roomId;
  String? nfcName;

  LockModifyRoomNfcReqEntity();

  factory LockModifyRoomNfcReqEntity.fromJson(Map<String, dynamic> json) =>
      $LockModifyRoomNfcReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $LockModifyRoomNfcReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
