import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_update_user_request_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordUpdateUserRequestEntity {
  late String id;
  late String name;
  late String avatarUrl;
  late String email;

  LandlordUpdateUserRequestEntity();

  factory LandlordUpdateUserRequestEntity.fromJson(Map<String, dynamic> json) =>
      $LandlordUpdateUserRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => $LandlordUpdateUserRequestEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
