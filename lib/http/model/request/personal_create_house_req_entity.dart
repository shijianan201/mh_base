import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/personal_create_house_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class PersonalCreateHouseReqEntity {
  String? houseName = '';
  String? houseAddress = '';
  String? houseUrl = '';

  PersonalCreateHouseReqEntity();

  factory PersonalCreateHouseReqEntity.fromJson(Map<String, dynamic> json) =>
      $PersonalCreateHouseReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $PersonalCreateHouseReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
