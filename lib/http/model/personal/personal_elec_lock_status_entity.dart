import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/personal_elec_lock_status_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class PersonalElecLockStatusEntity {
  String? electronicLockStatus = '';
  List<String>? tempPassword;
  List<String>? passwords;
  int? unlockMode = 0;
  int? rawMode = 0;
  int? status = 0;
  @JSONField(name: "_id")
  String? sId = '';
  String? electronicLockNumber = '';
  String? landlordPwd = '';

  PersonalElecLockStatusEntity();

  factory PersonalElecLockStatusEntity.fromJson(Map<String, dynamic> json) =>
      $PersonalElecLockStatusEntityFromJson(json);

  Map<String, dynamic> toJson() => $PersonalElecLockStatusEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
