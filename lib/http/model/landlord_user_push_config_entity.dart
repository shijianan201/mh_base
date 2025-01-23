import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_user_push_config_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordUserPushConfigEntity {
	late bool push;
	late bool sms;
	late bool lease;
	late bool pay;
	late bool warranty;
	@JSONField(name: "_id")
	late String sId;
	late String landlordId;

	LandlordUserPushConfigEntity();

	factory LandlordUserPushConfigEntity.fromJson(Map<String, dynamic> json) => $LandlordUserPushConfigEntityFromJson(json);

	Map<String, dynamic> toJson() => $LandlordUserPushConfigEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}