import 'package:landlord_mtech/base/http/model/personal/personal_elec_lock_status_entity.dart';
import 'package:landlord_mtech/base/http/model/personal/personal_owner_info_entity.dart';
import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/personal_room_info_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class PersonalRoomInfoEntity {
  String? description = '';
  List<String>? pictures;
  @JSONField(name: "_id")
  String? sId = '';
  String? roomName = '';
  PersonalElecLockStatusEntity? electronicLockInfo;
  String? electronicLockStatus;
  PersonalOwnerInfoEntity? ownerId;
  List<PersonalOwnerInfoEntity>? members;

  PersonalRoomInfoEntity();

  void clear4inviteMessage() {
    members = null;
    ownerId = null;
    electronicLockStatus = null;
    electronicLockInfo = null;
    description = null;
  }

  factory PersonalRoomInfoEntity.fromJson(Map<String, dynamic> json) =>
      $PersonalRoomInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $PersonalRoomInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
