import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/app_upgrade_info_entity.g.dart';
import 'dart:convert';
export 'package:landlord_mtech/generated/json/app_upgrade_info_entity.g.dart';

@JsonSerializable()
class AppUpgradeInfoEntity {
	String? link;
	String? version;
	int? versionCode;
	bool? isNewVersion;
	bool? isForcedUpdate;

	AppUpgradeInfoEntity();

	factory AppUpgradeInfoEntity.fromJson(Map<String, dynamic> json) => $AppUpgradeInfoEntityFromJson(json);

	Map<String, dynamic> toJson() => $AppUpgradeInfoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}