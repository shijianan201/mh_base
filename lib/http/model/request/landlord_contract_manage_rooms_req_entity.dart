import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_contract_manage_rooms_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordContractManageRoomsReqEntity {
  late String roomId;
  String? floorNumber;
  String? houseId;

  LandlordContractManageRoomsReqEntity();

  factory LandlordContractManageRoomsReqEntity.fromJson(
          Map<String, dynamic> json) =>
      $LandlordContractManageRoomsReqEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      $LandlordContractManageRoomsReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
