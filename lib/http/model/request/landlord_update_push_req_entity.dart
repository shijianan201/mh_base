import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_update_push_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordUpdatePushReqEntity {
  bool push = false;
  bool sms = false;
  bool lease = false;
  bool pay = false;
  bool warranty = false;

  LandlordUpdatePushReqEntity();

  factory LandlordUpdatePushReqEntity.fromJson(Map<String, dynamic> json) =>
      $LandlordUpdatePushReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $LandlordUpdatePushReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
