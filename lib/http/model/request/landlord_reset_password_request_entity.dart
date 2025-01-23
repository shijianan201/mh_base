import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_reset_password_request_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordResetPasswordRequestEntity {
	late String phoneNumber;
	late String password;
	late String verifyCode;

	LandlordResetPasswordRequestEntity();

	factory LandlordResetPasswordRequestEntity.fromJson(Map<String, dynamic> json) => $LandlordResetPasswordRequestEntityFromJson(json);

	Map<String, dynamic> toJson() => $LandlordResetPasswordRequestEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}