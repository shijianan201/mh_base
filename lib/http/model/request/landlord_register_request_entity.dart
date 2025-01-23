import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_register_request_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordRegisterRequestEntity {
  late String name;
  late String phoneNumber;
  late String password;
  late String verifyCode;
  late int loginType;
  @JSONField(name: "LoginId")
  String? loginId;
  late int notification;
  String? extra;

  LandlordRegisterRequestEntity();

  factory LandlordRegisterRequestEntity.fromJson(Map<String, dynamic> json) =>
      $LandlordRegisterRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => $LandlordRegisterRequestEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
