import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_update_contract_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordUpdateContractReqEntity {
  String? memo;
  int? contractStatus;
  late String contractId;

  LandlordUpdateContractReqEntity();

  factory LandlordUpdateContractReqEntity.fromJson(Map<String, dynamic> json) =>
      $LandlordUpdateContractReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $LandlordUpdateContractReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
