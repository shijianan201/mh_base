import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_room_size_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordRoomSizeEntity {
	@JSONField(name: "_id")
	late String sId;
	late String roomSize;

	LandlordRoomSizeEntity();

	factory LandlordRoomSizeEntity.fromJson(Map<String, dynamic> json) => $LandlordRoomSizeEntityFromJson(json);

	Map<String, dynamic> toJson() => $LandlordRoomSizeEntityToJson(this);

	@override
	String toString() {
		return roomSize;
	}
}