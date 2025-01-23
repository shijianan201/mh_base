import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/repair_add_provider_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class RepairAddProviderReqEntity {
  late String repairLocationName;
  late String repairContactName;
  late String repairPhoneNumber;
  late String repairLocationAddress;
  late String repairBusinessHours;

  RepairAddProviderReqEntity();

  factory RepairAddProviderReqEntity.fromJson(Map<String, dynamic> json) =>
      $RepairAddProviderReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $RepairAddProviderReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
