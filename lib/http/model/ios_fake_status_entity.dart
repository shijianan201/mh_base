import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/ios_fake_status_entity.g.dart';
import 'dart:convert';
export 'package:landlord_mtech/generated/json/ios_fake_status_entity.g.dart';

@JsonSerializable()
class IosFakeStatusEntity {
	int? status;
	String? msg;
	IosFakeStatusData? data;

	IosFakeStatusEntity();

	factory IosFakeStatusEntity.fromJson(Map<String, dynamic> json) => $IosFakeStatusEntityFromJson(json);

	Map<String, dynamic> toJson() => $IosFakeStatusEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class IosFakeStatusData {
	String? version;
	String? versionCode;
	String? url;

	IosFakeStatusData();

	factory IosFakeStatusData.fromJson(Map<String, dynamic> json) => $IosFakeStatusDataFromJson(json);

	Map<String, dynamic> toJson() => $IosFakeStatusDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}