import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/add_floor_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class AddFloorReqEntity {
  String? floorId = '';
  int? floorNumber = 0;

  AddFloorReqEntity();

  factory AddFloorReqEntity.fromJson(Map<String, dynamic> json) =>
      $AddFloorReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $AddFloorReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
