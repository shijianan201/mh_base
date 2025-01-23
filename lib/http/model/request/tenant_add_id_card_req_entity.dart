import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/tenant_add_id_card_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TenantAddIdCardReqEntity {
  @JSONField(name: "id_number")
  late String idNumber;
  late String address;
  late String name;
  String? gender;
  String? birthday;

  TenantAddIdCardReqEntity();

  factory TenantAddIdCardReqEntity.fromJson(Map<String, dynamic> json) =>
      $TenantAddIdCardReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $TenantAddIdCardReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
