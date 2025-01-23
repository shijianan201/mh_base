import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/lock_room_nfclist_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LockRoomNfclistReqEntity {
  String? lockId;
  String? nfcId;
  String? roomId;
  String? nfcName;

  LockRoomNfclistReqEntity();

  factory LockRoomNfclistReqEntity.fromJson(Map<String, dynamic> json) =>
      $LockRoomNfclistReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $LockRoomNfclistReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
