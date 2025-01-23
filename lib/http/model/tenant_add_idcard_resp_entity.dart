import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/tenant_add_idcard_resp_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TenantAddIdcardRespEntity {
  @JSONField(name: "id_card")
  late TenantAddIdcardRespIdCard idCard;

  TenantAddIdcardRespEntity();

  factory TenantAddIdcardRespEntity.fromJson(Map<String, dynamic> json) =>
      $TenantAddIdcardRespEntityFromJson(json);

  Map<String, dynamic> toJson() => $TenantAddIdcardRespEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TenantAddIdcardRespAddress {
  late String street;
  late String city;
  late String state;
  late String country;
  late String zip;

  TenantAddIdcardRespAddress();

  factory TenantAddIdcardRespAddress.fromJson(Map<String, dynamic> json) =>
      $TenantAddIdcardRespAddressFromJson(json);

  Map<String, dynamic> toJson() => $TenantAddIdcardRespAddressToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TenantAddIdcardRespIdCard {
  @JSONField(name: "id_number")
  late String idNumber;
  late String address;
  String? name;
  String? gender;
  String? birthday;

  TenantAddIdcardRespIdCard();

  factory TenantAddIdcardRespIdCard.fromJson(Map<String, dynamic> json) =>
      $TenantAddIdcardRespIdCardFromJson(json);

  Map<String, dynamic> toJson() => $TenantAddIdcardRespIdCardToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
