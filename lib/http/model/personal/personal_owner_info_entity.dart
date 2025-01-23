import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/personal_owner_info_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class PersonalOwnerInfoEntity {
  String? email = '';
  String? avatarUrl = '';
  String? address = '';
  int? notification = 0;
  @JSONField(name: "_id")
  String? sId = '';
  String? name = '';
  String? phoneNumber = '';

  PersonalOwnerInfoEntity();

  factory PersonalOwnerInfoEntity.fromJson(Map<String, dynamic> json) =>
      $PersonalOwnerInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $PersonalOwnerInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
