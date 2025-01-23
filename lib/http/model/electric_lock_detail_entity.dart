import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/electric_lock_detail_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ElectricLockDetailEntity {
  String? leaseDuration = '';
  String? roomId = '';
  String? lockId = '';
  String? electronicLockStatus = '';
  String? electronicLockNumber = '';
  int? warranty = 0;
  String? wallpaper;
  String? voice;
  int? startTime;
  int? endTime;
  String? devicePwd;

  ElectricLockDetailEntity();

  factory ElectricLockDetailEntity.fromJson(Map<String, dynamic> json) =>
      $ElectricLockDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $ElectricLockDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
