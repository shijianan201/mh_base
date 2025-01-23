import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_multi_file_upload_res_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordMultiFileUploadResEntity {
	late List<String> urls;

	LandlordMultiFileUploadResEntity();

	factory LandlordMultiFileUploadResEntity.fromJson(Map<String, dynamic> json) => $LandlordMultiFileUploadResEntityFromJson(json);

	Map<String, dynamic> toJson() => $LandlordMultiFileUploadResEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}