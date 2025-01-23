import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/repair_delete_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class RepairDeleteReqEntity {
  late String repairId;

  RepairDeleteReqEntity();

  factory RepairDeleteReqEntity.fromJson(Map<String, dynamic> json) =>
      $RepairDeleteReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $RepairDeleteReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
