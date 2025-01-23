import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_floorsinfo_by_id_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordFloorsInfoByIdEntity {
  late String floorId;

  LandlordFloorsInfoByIdEntity();

  factory LandlordFloorsInfoByIdEntity.fromJson(Map<String, dynamic> json) =>
      $LandlordFloorsInfoByIdEntityFromJson(json);

  Map<String, dynamic> toJson() => $LandlordFloorsInfoByIdEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
