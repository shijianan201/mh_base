import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/tenant_add_bank_profile_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TenantAddBankProfileReqEntity {
  late int type;
  late TenantAddBankProfileReqCard card;

  TenantAddBankProfileReqEntity();

  factory TenantAddBankProfileReqEntity.fromJson(Map<String, dynamic> json) =>
      $TenantAddBankProfileReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $TenantAddBankProfileReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TenantAddBankProfileReqCard {
  @JSONField(name: "card_number")
  late String cardNumber;
  @JSONField(name: "cardholder_name")
  late String cardholderName;
  @JSONField(name: "expiration_date")
  String? expirationDate;
  @JSONField(name: "security_code")
  String? securityCode;

  TenantAddBankProfileReqCard();

  factory TenantAddBankProfileReqCard.fromJson(Map<String, dynamic> json) =>
      $TenantAddBankProfileReqCardFromJson(json);

  Map<String, dynamic> toJson() => $TenantAddBankProfileReqCardToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
