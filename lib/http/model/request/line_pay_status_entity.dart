import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/line_pay_status_entity.g.dart';
import 'dart:convert';
export 'package:landlord_mtech/generated/json/line_pay_status_entity.g.dart';

@JsonSerializable()
class LinePayStatusEntity {
	late String orderId;

	LinePayStatusEntity();

	factory LinePayStatusEntity.fromJson(Map<String, dynamic> json) => $LinePayStatusEntityFromJson(json);

	Map<String, dynamic> toJson() => $LinePayStatusEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}