import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_pay_bill_resp_entity.g.dart';
import 'dart:convert';
export 'package:landlord_mtech/generated/json/landlord_pay_bill_resp_entity.g.dart';

@JsonSerializable()
class LandlordPayBillRespEntity {
	late LandlordPayBillRespHouseInfo houseInfo;
	late List<LandlordPayBillRespDayPallBill> dayPallBill;

	LandlordPayBillRespEntity();

	factory LandlordPayBillRespEntity.fromJson(Map<String, dynamic> json) => $LandlordPayBillRespEntityFromJson(json);

	Map<String, dynamic> toJson() => $LandlordPayBillRespEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class LandlordPayBillRespHouseInfo {
	@JSONField(name: "_id")
	late String id;
	late String houseName;

	LandlordPayBillRespHouseInfo();

	factory LandlordPayBillRespHouseInfo.fromJson(Map<String, dynamic> json) => $LandlordPayBillRespHouseInfoFromJson(json);

	Map<String, dynamic> toJson() => $LandlordPayBillRespHouseInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class LandlordPayBillRespDayPallBill {
	@JSONField(name: "_id")
	late LandlordPayBillRespDayPallBillId id;
	late double totalIncome;

	LandlordPayBillRespDayPallBill();

	factory LandlordPayBillRespDayPallBill.fromJson(Map<String, dynamic> json) => $LandlordPayBillRespDayPallBillFromJson(json);

	Map<String, dynamic> toJson() => $LandlordPayBillRespDayPallBillToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class LandlordPayBillRespDayPallBillId {
	late int year;
	late int month;
	late int day;
	late String houseId;
	late String houseName;

	LandlordPayBillRespDayPallBillId();

	factory LandlordPayBillRespDayPallBillId.fromJson(Map<String, dynamic> json) => $LandlordPayBillRespDayPallBillIdFromJson(json);

	Map<String, dynamic> toJson() => $LandlordPayBillRespDayPallBillIdToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}