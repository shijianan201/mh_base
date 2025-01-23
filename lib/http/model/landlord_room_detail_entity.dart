import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:landlord_mtech/base/http/model/landlord_room_size_entity.dart';
import 'package:landlord_mtech/generated/assets_generator.dart';
import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_room_detail_entity.g.dart';
import 'dart:convert';

enum ElectricLockStatus {
  unBind("1", "未綁定"),
  binding("2", "已綁定-連接正常"),
  bindException("3", "已綁定-連接異常");

  final String serverCode;
  final String title;

  const ElectricLockStatus(this.serverCode, this.title);

  String getAssetsIcon() {
    if (this == ElectricLockStatus.binding) {
      return GenAssets.lockLockStatusBinding;
    } else if (this == ElectricLockStatus.bindException) {
      return GenAssets.lockLockStatusBindError;
    }
    return GenAssets.lockLockStatusUnbind;
  }

  static ElectricLockStatus map(dynamic value) {
    ElectricLockStatus lockStatus = ElectricLockStatus.unBind;
    if (value == "2" || value == 2) {
      return ElectricLockStatus.binding;
    }
    if (value == "3" || value == 3) {
      return ElectricLockStatus.bindException;
    }
    return lockStatus;
  }
}

@JsonSerializable()
class LandlordRoomDetailEntity {
  late int status;
  late String description;
  List<LandlordRoomDetailFeatures> features = [];
  late int rent;
  List<String> pictures = [];
  @JSONField(name: "_id")
  late String sId;
  late String roomNumber;
  LandlordRoomDetailHouseId? houseId;
  late String landlordId;
  late int floorNumber;
  late String createdAt;
  late String updatedAt;
  String? contractNO;
  LandlordRoomSizeEntity? roomSize;
  String? electronicLockStatus;
  LandlordRoomElectricLockInfo? electronicLockInfo;

  LandlordRoomDetailEntity();

  factory LandlordRoomDetailEntity.fromJson(Map<String, dynamic> json) =>
      $LandlordRoomDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $LandlordRoomDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LandlordRoomDetailFeatures {
  @JSONField(name: "_id")
  late String sId;
  late String feature;

  LandlordRoomDetailFeatures();

  factory LandlordRoomDetailFeatures.fromJson(Map<String, dynamic> json) =>
      $LandlordRoomDetailFeaturesFromJson(json);

  Map<String, dynamic> toJson() => $LandlordRoomDetailFeaturesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LandlordRoomDetailHouseId {
  late String houseUrl;
  @JSONField(name: "_id")
  late String sId;
  late String houseName;
  late String houseAddress;

  LandlordRoomDetailHouseId();

  factory LandlordRoomDetailHouseId.fromJson(Map<String, dynamic> json) =>
      $LandlordRoomDetailHouseIdFromJson(json);

  Map<String, dynamic> toJson() => $LandlordRoomDetailHouseIdToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LandlordRoomElectricLockInfo {
  @JSONField(name: "_id")
  late String sId;
  late String electronicLockStatus;
  late String electronicLockNumber;
  late String createdAt;
  String? landlordPwd;

  LandlordRoomElectricLockInfo();

  factory LandlordRoomElectricLockInfo.fromJson(Map<String, dynamic> json) =>
      $LandlordRoomElectricLockInfoFromJson(json);

  Map<String, dynamic> toJson() => $LandlordRoomElectricLockInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
