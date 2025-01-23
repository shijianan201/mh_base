import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_pay_bill_request_entity.g.dart';
import 'dart:convert';
export 'package:landlord_mtech/generated/json/landlord_pay_bill_request_entity.g.dart';

@JsonSerializable()
class LandlordPayBillRequestEntity {
	late int type;
	late int startYear;
	late int startMonth;
	late int endYear;
	late int endMonth;
	late List<String> houseIds;

	LandlordPayBillRequestEntity();

	factory LandlordPayBillRequestEntity.fromJson(Map<String, dynamic> json) => $LandlordPayBillRequestEntityFromJson(json);

	Map<String, dynamic> toJson() => $LandlordPayBillRequestEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}