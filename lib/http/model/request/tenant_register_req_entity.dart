import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/tenant_register_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TenantRegisterReqEntity {
  late String name;
  late String phoneNumber;
  late String password;
  late String verifyCode;
  late int loginType;
  late String loginId;
  late String extra;
  @JSONField(name: "id_card")
  TenantRegisterReqIdCard? idCard;
  @JSONField(name: "credit_cards")
  List<TenantRegisterReqCreditCards>? creditCards;
  @JSONField(name: "bank_cards")
  List<TenantRegisterReqBankCards>? bankCards;

  TenantRegisterReqEntity();

  factory TenantRegisterReqEntity.fromJson(Map<String, dynamic> json) =>
      $TenantRegisterReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $TenantRegisterReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TenantRegisterReqIdCard {
  @JSONField(name: "id_number")
  late String idNumber;
  late String address;
  String? name;
  String? gender;
  String? birthday;

  TenantRegisterReqIdCard();

  factory TenantRegisterReqIdCard.fromJson(Map<String, dynamic> json) =>
      $TenantRegisterReqIdCardFromJson(json);

  Map<String, dynamic> toJson() => $TenantRegisterReqIdCardToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TenantRegisterReqCreditCards {
  @JSONField(name: "card_number")
  late String cardNumber;
  @JSONField(name: "cardholder_name")
  late String cardholderName;
  @JSONField(name: "expiration_date")
  late String expirationDate;
  @JSONField(name: "security_code")
  late String securityCode;

  TenantRegisterReqCreditCards();

  factory TenantRegisterReqCreditCards.fromJson(Map<String, dynamic> json) =>
      $TenantRegisterReqCreditCardsFromJson(json);

  Map<String, dynamic> toJson() => $TenantRegisterReqCreditCardsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TenantRegisterReqBankCards {
  @JSONField(name: "card_number")
  late String cardNumber;
  @JSONField(name: "cardholder_name")
  late String cardholderName;
  @JSONField(name: "expiration_date")
  late String expirationDate;
  @JSONField(name: "security_code")
  late String securityCode;

  TenantRegisterReqBankCards();

  factory TenantRegisterReqBankCards.fromJson(Map<String, dynamic> json) =>
      $TenantRegisterReqBankCardsFromJson(json);

  Map<String, dynamic> toJson() => $TenantRegisterReqBankCardsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
