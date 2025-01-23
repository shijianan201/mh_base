import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/land_lord_add_house_config_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandLordAddHouseConfigEntity {
  late int floorNumber;
  late int roomNumber;

  LandLordAddHouseConfigEntity();

  factory LandLordAddHouseConfigEntity.fromJson(Map<String, dynamic> json) =>
      $LandLordAddHouseConfigEntityFromJson(json);

  Map<String, dynamic> toJson() => $LandLordAddHouseConfigEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
