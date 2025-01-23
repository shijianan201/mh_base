import 'package:flutter/cupertino.dart';
import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/tenant_contract_info_entity.g.dart';
import 'dart:convert';

import 'package:landlord_mtech/base/colors.dart';
import 'package:landlord_mtech/base/common_property.dart';

enum ContractTerminateStatus {
  normal(0),
  waitTerminate(1),
  terminated(2);

  final int code;

  const ContractTerminateStatus(this.code);

  static ContractTerminateStatus of(int? code) {
    if (code == 1) {
      return ContractTerminateStatus.waitTerminate;
    }
    if (code == 2) {
      return ContractTerminateStatus.terminated;
    }
    return ContractTerminateStatus.normal;
  }

  Widget getButton() {
    if (this == ContractTerminateStatus.terminated) {
      return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: MyColors.greyc7, borderRadius: BorderRadius.circular(4)),
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Text(
          "合約已中止",
          strutStyle: CommonProperty.getTextStructStyle(12),
          style: TextStyle(
              color: MyColors.white, fontSize: 12, fontWeight: FontWeight.bold),
        ),
      );
    } else if (this == ContractTerminateStatus.waitTerminate) {
      return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: MyColors.main, width: 1),
            color: MyColors.white,
            borderRadius: BorderRadius.circular(4)),
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Text(
          "中止合約申請中",
          strutStyle: CommonProperty.getTextStructStyle(12),
          style: TextStyle(
              color: MyColors.main, fontSize: 12, fontWeight: FontWeight.bold),
        ),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: MyColors.accent, borderRadius: BorderRadius.circular(4)),
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Text(
          "中止合約",
          strutStyle: CommonProperty.getTextStructStyle(12),
          style: TextStyle(
              color: MyColors.white, fontSize: 12, fontWeight: FontWeight.bold),
        ),
      );
    }
  }
}

@JsonSerializable()
class TenantContractInfoEntity {
  late int rent;
  late int deposit;
  late String depositInfo;
  late int collectionDay;
  late int electricityType;
  late int currentMeterReading;
  late int electricityPrice;
  late List<String> contractPictures;
  late String memo;
  late int authorizationStatus;
  late int contractStatus;
  @JSONField(name: "_id")
  late String sId;
  late String roomId;
  late String landlordId;
  late String houseId;
  late String tenantId;
  late String startTime;
  late String endTime;
  late int contractType;
  late TenantContractInfoRoomInfo roomInfo;
  late String createdAt;
  late String updatedAt;
  int? renewContract;
  int? renewMonth;
  int? terminationStatus;

  TenantContractInfoEntity();

  factory TenantContractInfoEntity.fromJson(Map<String, dynamic> json) =>
      $TenantContractInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $TenantContractInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TenantContractInfoRoomInfo {
  late int status;
  late String contractNO;
  late String description;
  late int rent;
  @JSONField(name: "_id")
  late String sId;
  late String roomNumber;
  TenantContractInfoRoomInfoHouseId? houseId;
  late String landlordId;
  late int floorNumber;
  late String createdAt;
  late String updatedAt;

  TenantContractInfoRoomInfo();

  factory TenantContractInfoRoomInfo.fromJson(Map<String, dynamic> json) =>
      $TenantContractInfoRoomInfoFromJson(json);

  Map<String, dynamic> toJson() => $TenantContractInfoRoomInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TenantContractInfoRoomInfoHouseId {
  late String houseUrl;
  late List<int> floors;
  @JSONField(name: "_id")
  late String sId;
  late String houseName;
  late String houseAddress;
  late String landlordId;
  late String createdAt;
  late String updatedAt;

  TenantContractInfoRoomInfoHouseId();

  factory TenantContractInfoRoomInfoHouseId.fromJson(
          Map<String, dynamic> json) =>
      $TenantContractInfoRoomInfoHouseIdFromJson(json);

  Map<String, dynamic> toJson() =>
      $TenantContractInfoRoomInfoHouseIdToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
