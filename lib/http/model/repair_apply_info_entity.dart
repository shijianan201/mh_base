import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/repair_apply_info_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class RepairApplyInfoEntity {
  late List<String> pictures;
  late int status;
  @JSONField(name: "_id")
  late String sId;
  late String landlordId;
  late String tenantId;
  late String repairType;
  late String repairDesc;
  late String createdAt;
  late String updatedAt;
  String? houseName;
  String? roomNumber;
  RepairTenantInfo? tenantInfo;
  RepairRoomInfo? roomInfo;

  RepairApplyInfoEntity();

  factory RepairApplyInfoEntity.fromJson(Map<String, dynamic> json) =>
      $RepairApplyInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $RepairApplyInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RepairTenantInfo {
  @JSONField(name: "_id")
  late String sId;
  String? name;
  String? phoneNumber;
  RepairTenantInfo();

  factory RepairTenantInfo.fromJson(Map<String, dynamic> json) =>
      $RepairTenantInfoFromJson(json);

  Map<String, dynamic> toJson() => $RepairTenantInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RepairRoomInfo {
  @JSONField(name: "_id")
  late String sId;
  String? description;
  String? roomNumber;
  RepairRoomInfoHouseId? houseId;

  RepairRoomInfo();

  factory RepairRoomInfo.fromJson(Map<String, dynamic> json) =>
      $RepairRoomInfoFromJson(json);

  Map<String, dynamic> toJson() => $RepairRoomInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RepairRoomInfoHouseId {
  @JSONField(name: "_id")
  late String sId;
  String? houseName;
  String? houseAddress;

  RepairRoomInfoHouseId();

  factory RepairRoomInfoHouseId.fromJson(Map<String, dynamic> json) =>
      $RepairRoomInfoHouseIdFromJson(json);

  Map<String, dynamic> toJson() => $RepairRoomInfoHouseIdToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
