import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/line_pay_confirm_req_entity.g.dart';
import 'dart:convert';
export 'package:landlord_mtech/generated/json/line_pay_confirm_req_entity.g.dart';

@JsonSerializable()
class LinePayConfirmReqEntity {
	late String transactionId;
	late String orderId;

	LinePayConfirmReqEntity();

	factory LinePayConfirmReqEntity.fromJson(Map<String, dynamic> json) => $LinePayConfirmReqEntityFromJson(json);

	Map<String, dynamic> toJson() => $LinePayConfirmReqEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}