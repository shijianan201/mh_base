import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/repair_provider_info_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class RepairProviderInfoEntity {
  String? repairPhoneNumber;
  String? repairLocationAddress;
  String? repairBusinessHours;
  @JSONField(name: "_id")
  late String sId;
  String? repairLocationName;
  String? landlordId;
  String? repairContactName;
  late String createdAt;
  late String updatedAt;

  RepairProviderInfoEntity();

  factory RepairProviderInfoEntity.fromJson(Map<String, dynamic> json) =>
      $RepairProviderInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $RepairProviderInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
