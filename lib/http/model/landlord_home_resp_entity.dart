import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_home_resp_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordHomeRespEntity {
  int? payment = 0;
  String? timestamp = '';
  int? repairMsg = 0;
  int? msg = 0;
  int? unPaidMsg = 0;
  int? pushMsg = 0;
  int? activeContractsCount = 0;
  int? overdueContractsCount = 0;
  int? expiringContractsCount = 0;

  LandlordHomeRespEntity();

  factory LandlordHomeRespEntity.fromJson(Map<String, dynamic> json) =>
      $LandlordHomeRespEntityFromJson(json);

  Map<String, dynamic> toJson() => $LandlordHomeRespEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
