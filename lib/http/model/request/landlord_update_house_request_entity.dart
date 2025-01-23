import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_update_house_request_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordUpdateHouseRequestEntity {
	late String houseId;
	late String houseName;
	late String houseAddress;
	late String houseUrl;

	LandlordUpdateHouseRequestEntity();

	factory LandlordUpdateHouseRequestEntity.fromJson(Map<String, dynamic> json) => $LandlordUpdateHouseRequestEntityFromJson(json);

	Map<String, dynamic> toJson() => $LandlordUpdateHouseRequestEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}