import 'package:landlord_mtech/base/http/model/personal/personal_owner_info_entity.dart';
import 'package:landlord_mtech/base/http/model/personal/personal_room_info_entity.dart';
import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/personal_house_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class PersonalHouseEntity {
  String? houseUrl = '';
  List<PersonalRoomInfoEntity>? rooms;
  @JSONField(name: "_id")
  String? sId = '';
  String? houseName = '';
  String? houseAddress = '';
  PersonalOwnerInfoEntity? ownerId;
  List<PersonalOwnerInfoEntity>? members;
  String? createdAt = '';
  String? updatedAt = '';

  PersonalHouseEntity();

  factory PersonalHouseEntity.fromJson(Map<String, dynamic> json) =>
      $PersonalHouseEntityFromJson(json);

  Map<String, dynamic> toJson() => $PersonalHouseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
