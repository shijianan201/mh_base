import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/ios_fake_status_req_entity.g.dart';
import 'dart:convert';
export 'package:landlord_mtech/generated/json/ios_fake_status_req_entity.g.dart';

@JsonSerializable()
class IosFakeStatusReqEntity {
	String? version;
	int? versionCode;

	IosFakeStatusReqEntity();

	factory IosFakeStatusReqEntity.fromJson(Map<String, dynamic> json) => $IosFakeStatusReqEntityFromJson(json);

	Map<String, dynamic> toJson() => $IosFakeStatusReqEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}