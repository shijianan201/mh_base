import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_contract_manage_filter_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordContractManageFilterEntity {
  late List<int> floors;
  @JSONField(name: "_id")
  late String sId;
  late String houseName;
  late String landlordId;

  LandlordContractManageFilterEntity();

  factory LandlordContractManageFilterEntity.fromJson(
          Map<String, dynamic> json) =>
      $LandlordContractManageFilterEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      $LandlordContractManageFilterEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
