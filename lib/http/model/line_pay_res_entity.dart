import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/line_pay_res_entity.g.dart';
import 'dart:convert';
export 'package:landlord_mtech/generated/json/line_pay_res_entity.g.dart';

@JsonSerializable()
class LinePayResEntity {
	late LinePayResRes res;
	late int totalAmount;

	LinePayResEntity();

	factory LinePayResEntity.fromJson(Map<String, dynamic> json) => $LinePayResEntityFromJson(json);

	Map<String, dynamic> toJson() => $LinePayResEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class LinePayResRes {
	late LinePayResResBody body;
	late LinePayResResComments comments;

	LinePayResRes();

	factory LinePayResRes.fromJson(Map<String, dynamic> json) => $LinePayResResFromJson(json);

	Map<String, dynamic> toJson() => $LinePayResResToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class LinePayResResBody {
	late String returnCode;
	late String returnMessage;
	late LinePayResResBodyInfo info;

	LinePayResResBody();

	factory LinePayResResBody.fromJson(Map<String, dynamic> json) => $LinePayResResBodyFromJson(json);

	Map<String, dynamic> toJson() => $LinePayResResBodyToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class LinePayResResBodyInfo {
	late LinePayResResBodyInfoPaymentUrl paymentUrl;
	late String transactionId;
	late String paymentAccessToken;

	LinePayResResBodyInfo();

	factory LinePayResResBodyInfo.fromJson(Map<String, dynamic> json) => $LinePayResResBodyInfoFromJson(json);

	Map<String, dynamic> toJson() => $LinePayResResBodyInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class LinePayResResBodyInfoPaymentUrl {
	late String web;
	late String app;

	LinePayResResBodyInfoPaymentUrl();

	factory LinePayResResBodyInfoPaymentUrl.fromJson(Map<String, dynamic> json) => $LinePayResResBodyInfoPaymentUrlFromJson(json);

	Map<String, dynamic> toJson() => $LinePayResResBodyInfoPaymentUrlToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class LinePayResResComments {


	LinePayResResComments();

	factory LinePayResResComments.fromJson(Map<String, dynamic> json) => $LinePayResResCommentsFromJson(json);

	Map<String, dynamic> toJson() => $LinePayResResCommentsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}