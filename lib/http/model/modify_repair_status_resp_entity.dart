import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/modify_repair_status_resp_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ModifyRepairStatusRespEntity {
  List<String>? pictures;
  int? status = 0;
  @JSONField(name: "_id")
  String? sId = '';
  String? landlordId = '';
  String? tenantId = '';
  String? roomId = '';
  String? repairType = '';
  String? repairDesc = '';
  String? createdAt = '';
  String? updatedAt = '';

  ModifyRepairStatusRespEntity();

  factory ModifyRepairStatusRespEntity.fromJson(Map<String, dynamic> json) =>
      $ModifyRepairStatusRespEntityFromJson(json);

  Map<String, dynamic> toJson() => $ModifyRepairStatusRespEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
