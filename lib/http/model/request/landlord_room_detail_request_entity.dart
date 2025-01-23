import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_room_detail_request_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordRoomDetailRequestEntity {
	late String roomId;

	LandlordRoomDetailRequestEntity();

	factory LandlordRoomDetailRequestEntity.fromJson(Map<String, dynamic> json) => $LandlordRoomDetailRequestEntityFromJson(json);

	Map<String, dynamic> toJson() => $LandlordRoomDetailRequestEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}