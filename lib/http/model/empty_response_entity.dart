import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/empty_response_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class EmptyResponseEntity {

	EmptyResponseEntity();

	factory EmptyResponseEntity.fromJson(Map<String, dynamic> json) => $EmptyResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $EmptyResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}