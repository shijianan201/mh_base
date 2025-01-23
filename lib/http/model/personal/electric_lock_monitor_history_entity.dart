import 'dart:typed_data';

import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/electric_lock_monitor_history_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ElectricLockMonitorHistoryEntity {
  @JSONField(name: "_id")
  String? sId = '';
  String? name = '';
  int? type = 0;
  String? link = '';
  String? lockId = '';
  String? createdAt = '';
  String? updatedAt = '';
  @JSONField(serialize: false, deserialize: false)
  Uint8List? videoThumbnail;

  ElectricLockMonitorHistoryEntity();

  factory ElectricLockMonitorHistoryEntity.fromJson(
          Map<String, dynamic> json) =>
      $ElectricLockMonitorHistoryEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      $ElectricLockMonitorHistoryEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
