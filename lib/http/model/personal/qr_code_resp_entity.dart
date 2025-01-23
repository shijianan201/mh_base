import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/qr_code_resp_entity.g.dart';
import 'dart:convert';
export 'package:landlord_mtech/generated/json/qr_code_resp_entity.g.dart';

@JsonSerializable()
class QrCodeRespEntity {
	late String qrCodeNumber;

	QrCodeRespEntity();

	factory QrCodeRespEntity.fromJson(Map<String, dynamic> json) => $QrCodeRespEntityFromJson(json);

	Map<String, dynamic> toJson() => $QrCodeRespEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}