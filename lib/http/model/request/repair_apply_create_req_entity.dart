import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/repair_apply_create_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class RepairApplyCreateReqEntity {
  String? landlordId;
  late String repairType;
  late String repairDesc;
  late List<String> pictures;
  String? roomId;

  RepairApplyCreateReqEntity();

  factory RepairApplyCreateReqEntity.fromJson(Map<String, dynamic> json) =>
      $RepairApplyCreateReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $RepairApplyCreateReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
