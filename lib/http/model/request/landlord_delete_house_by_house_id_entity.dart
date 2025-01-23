import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_delete_house_by_house_id_entity.g.dart';
import 'dart:convert';
export 'package:landlord_mtech/generated/json/landlord_delete_house_by_house_id_entity.g.dart';

@JsonSerializable()
class LandlordDeleteHouseByHouseIdEntity {
	late String houseId;

	LandlordDeleteHouseByHouseIdEntity();

	factory LandlordDeleteHouseByHouseIdEntity.fromJson(Map<String, dynamic> json) => $LandlordDeleteHouseByHouseIdEntityFromJson(json);

	Map<String, dynamic> toJson() => $LandlordDeleteHouseByHouseIdEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}