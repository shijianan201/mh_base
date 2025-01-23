import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/lock_modify_room_nfc_resp_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LockModifyRoomNfcRespEntity {
  late String electronicLockStatus;
  late List<LockModifyRoomNfcRespNfcCards> nfcCards;
  late List<LockModifyRoomNfcRespTempPassword> tempPassword;
  late int unlockMode;
  @JSONField(name: "_id")
  late String sId;
  late String roomId;
  late String bindingCode;
  late String electronicLockNumber;
  late String password;
  late String createdAt;
  late String updatedAt;
  @JSONField(name: "__v")
  late int iV;

  LockModifyRoomNfcRespEntity();

  factory LockModifyRoomNfcRespEntity.fromJson(Map<String, dynamic> json) =>
      $LockModifyRoomNfcRespEntityFromJson(json);

  Map<String, dynamic> toJson() => $LockModifyRoomNfcRespEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LockModifyRoomNfcRespNfcCards {
  String? nfcId;
  String? nfcName;

  LockModifyRoomNfcRespNfcCards();

  factory LockModifyRoomNfcRespNfcCards.fromJson(Map<String, dynamic> json) =>
      $LockModifyRoomNfcRespNfcCardsFromJson(json);

  Map<String, dynamic> toJson() => $LockModifyRoomNfcRespNfcCardsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LockModifyRoomNfcRespTempPassword {
  late String startTime;
  late String endTime;
  late String password;
  late String remark;

  LockModifyRoomNfcRespTempPassword();

  factory LockModifyRoomNfcRespTempPassword.fromJson(
          Map<String, dynamic> json) =>
      $LockModifyRoomNfcRespTempPasswordFromJson(json);

  Map<String, dynamic> toJson() =>
      $LockModifyRoomNfcRespTempPasswordToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
