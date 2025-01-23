import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/line_pay_status_resp_entity.g.dart';
import 'dart:convert';
export 'package:landlord_mtech/generated/json/line_pay_status_resp_entity.g.dart';

@JsonSerializable()
class LinePayStatusRespEntity {
	late int orderType;
	late int orderStatus;
	late int orderAmount;
	late String orderDesc;
	late String orderBody;
	late String orderUid;
	late List<String> billIds;
	late String transactionId;
	late String contractId;
	@JSONField(name: "_id")
	late String id;
	late String orderId;
	late String orderTime;
	late String createdAt;
	late String updatedAt;

	LinePayStatusRespEntity();

	factory LinePayStatusRespEntity.fromJson(Map<String, dynamic> json) => $LinePayStatusRespEntityFromJson(json);

	Map<String, dynamic> toJson() => $LinePayStatusRespEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}