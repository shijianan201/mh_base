import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_verifycode_request_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordVerifycodeRequestEntity {
  late String phoneNumber;

  LandlordVerifycodeRequestEntity();

  factory LandlordVerifycodeRequestEntity.fromJson(Map<String, dynamic> json) =>
      $LandlordVerifycodeRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => $LandlordVerifycodeRequestEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
