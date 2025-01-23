import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/personal_update_house_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class PersonalUpdateHouseReqEntity {
  String? houseId = '';
  String? houseName = '';
  String? houseAddress = '';
  String? houseUrl = '';

  PersonalUpdateHouseReqEntity();

  factory PersonalUpdateHouseReqEntity.fromJson(Map<String, dynamic> json) =>
      $PersonalUpdateHouseReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $PersonalUpdateHouseReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
