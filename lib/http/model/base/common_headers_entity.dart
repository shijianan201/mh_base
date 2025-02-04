import 'package:mh_base/generated/json/base/json_field.dart';
import 'package:mh_base/generated/json/common_headers_entity.g.dart';
import 'dart:convert';
export 'package:mh_base/generated/json/common_headers_entity.g.dart';

@JsonSerializable()
class CommonHeadersEntity {
	late String platform = '';
	String authorization = "";
	String uid = "";

	CommonHeadersEntity();

	factory CommonHeadersEntity.fromJson(Map<String, dynamic> json) => $CommonHeadersEntityFromJson(json);

	Map<String, dynamic> toJson() => $CommonHeadersEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}