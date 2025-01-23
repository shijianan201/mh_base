import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/lock_bind_room_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LockBindRoomReqEntity {
	late String bindingCode;
	late String electronicLockNumber;
	late String roomId;

	LockBindRoomReqEntity();

	factory LockBindRoomReqEntity.fromJson(Map<String, dynamic> json) => $LockBindRoomReqEntityFromJson(json);

	Map<String, dynamic> toJson() => $LockBindRoomReqEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}