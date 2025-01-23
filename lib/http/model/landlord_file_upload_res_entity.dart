import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_file_upload_res_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordFileUploadResEntity {
	late String url;

	LandlordFileUploadResEntity();

	factory LandlordFileUploadResEntity.fromJson(Map<String, dynamic> json) => $LandlordFileUploadResEntityFromJson(json);

	Map<String, dynamic> toJson() => $LandlordFileUploadResEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}