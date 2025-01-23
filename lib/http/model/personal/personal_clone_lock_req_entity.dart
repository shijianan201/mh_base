import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/personal_clone_lock_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class PersonalCloneLockReqEntity {
  String? electronicLockNumber = '';
  String? cloneElectronicLockNumber = '';
  String? roomId = '';

  PersonalCloneLockReqEntity();

  factory PersonalCloneLockReqEntity.fromJson(Map<String, dynamic> json) =>
      $PersonalCloneLockReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $PersonalCloneLockReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
