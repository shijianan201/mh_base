import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/line_pay_req_entity.g.dart';
import 'dart:convert';
export 'package:landlord_mtech/generated/json/line_pay_req_entity.g.dart';

@JsonSerializable()
class LinePayReqEntity {
	late List<String> billIds;
	late int payType;
	late String contractId;


	LinePayReqEntity();

	factory LinePayReqEntity.fromJson(Map<String, dynamic> json) => $LinePayReqEntityFromJson(json);

	Map<String, dynamic> toJson() => $LinePayReqEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}