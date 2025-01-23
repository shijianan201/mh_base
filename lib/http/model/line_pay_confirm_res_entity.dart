import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/line_pay_confirm_res_entity.g.dart';
import 'dart:convert';
export 'package:landlord_mtech/generated/json/line_pay_confirm_res_entity.g.dart';

@JsonSerializable()
class LinePayConfirmResEntity {
	late LinePayConfirmResBody body;
	late LinePayConfirmResComments comments;

	LinePayConfirmResEntity();

	factory LinePayConfirmResEntity.fromJson(Map<String, dynamic> json) => $LinePayConfirmResEntityFromJson(json);

	Map<String, dynamic> toJson() => $LinePayConfirmResEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class LinePayConfirmResBody {
	late String returnCode;
	late String returnMessage;
	late LinePayConfirmResBodyInfo info;

	LinePayConfirmResBody();

	factory LinePayConfirmResBody.fromJson(Map<String, dynamic> json) => $LinePayConfirmResBodyFromJson(json);

	Map<String, dynamic> toJson() => $LinePayConfirmResBodyToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class LinePayConfirmResBodyInfo {
	late String transactionId;
	late String orderId;
	late List<LinePayConfirmResBodyInfoPayInfo> payInfo;
	late List<LinePayConfirmResBodyInfoPackages> packages;

	LinePayConfirmResBodyInfo();

	factory LinePayConfirmResBodyInfo.fromJson(Map<String, dynamic> json) => $LinePayConfirmResBodyInfoFromJson(json);

	Map<String, dynamic> toJson() => $LinePayConfirmResBodyInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class LinePayConfirmResBodyInfoPayInfo {
	late String method;
	late int amount;
	late String maskedCreditCardNumber;

	LinePayConfirmResBodyInfoPayInfo();

	factory LinePayConfirmResBodyInfoPayInfo.fromJson(Map<String, dynamic> json) => $LinePayConfirmResBodyInfoPayInfoFromJson(json);

	Map<String, dynamic> toJson() => $LinePayConfirmResBodyInfoPayInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class LinePayConfirmResBodyInfoPackages {
	late String id;
	late int amount;
	late int userFeeAmount;
	late List<LinePayConfirmResBodyInfoPackagesProducts> products;

	LinePayConfirmResBodyInfoPackages();

	factory LinePayConfirmResBodyInfoPackages.fromJson(Map<String, dynamic> json) => $LinePayConfirmResBodyInfoPackagesFromJson(json);

	Map<String, dynamic> toJson() => $LinePayConfirmResBodyInfoPackagesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class LinePayConfirmResBodyInfoPackagesProducts {
	late String name;
	late int quantity;
	late int price;

	LinePayConfirmResBodyInfoPackagesProducts();

	factory LinePayConfirmResBodyInfoPackagesProducts.fromJson(Map<String, dynamic> json) => $LinePayConfirmResBodyInfoPackagesProductsFromJson(json);

	Map<String, dynamic> toJson() => $LinePayConfirmResBodyInfoPackagesProductsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class LinePayConfirmResComments {


	LinePayConfirmResComments();

	factory LinePayConfirmResComments.fromJson(Map<String, dynamic> json) => $LinePayConfirmResCommentsFromJson(json);

	Map<String, dynamic> toJson() => $LinePayConfirmResCommentsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}