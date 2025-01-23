import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/qr_code_req_entity.dart_entity.g.dart';
import 'dart:convert';
export 'package:landlord_mtech/generated/json/qr_code_req_entity.dart_entity.g.dart';

@JsonSerializable()
class QrCodeReqEntity {
	String? lockId="";

	QrCodeReqEntity();

	factory QrCodeReqEntity.fromJson(Map<String, dynamic> json) => $QrCodeReqEntityFromJson(json);

	Map<String, dynamic> toJson() => $QrCodeReqEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}