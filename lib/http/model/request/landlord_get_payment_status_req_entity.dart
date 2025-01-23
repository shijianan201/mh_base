import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_get_payment_status_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordGetPaymentStatusReqEntity {
  late String contractId;

  LandlordGetPaymentStatusReqEntity();

  factory LandlordGetPaymentStatusReqEntity.fromJson(
          Map<String, dynamic> json) =>
      $LandlordGetPaymentStatusReqEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      $LandlordGetPaymentStatusReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
