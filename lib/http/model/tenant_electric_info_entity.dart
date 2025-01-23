import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/tenant_electric_info_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TenantElectricInfoEntity {
  late double lastMeterReading;
  late double electricityPrice;

  TenantElectricInfoEntity();

  factory TenantElectricInfoEntity.fromJson(Map<String, dynamic> json) =>
      $TenantElectricInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $TenantElectricInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
