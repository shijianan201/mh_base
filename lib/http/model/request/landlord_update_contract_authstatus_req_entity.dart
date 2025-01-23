import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_update_contract_authstatus_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordUpdateContractAuthstatusReqEntity {
  late int authorizationStatus;
  late String contractId;

  LandlordUpdateContractAuthstatusReqEntity();

  factory LandlordUpdateContractAuthstatusReqEntity.fromJson(
          Map<String, dynamic> json) =>
      $LandlordUpdateContractAuthstatusReqEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      $LandlordUpdateContractAuthstatusReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
