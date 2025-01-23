import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/tenant_login_info_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TenantLoginInfoEntity {
  late TenantLoginInfoAddress address;
  @JSONField(name: "id_card")
  TenantLoginInfoIdCard? idCard = null;
  late String name;
  late String gender;
  late String birthdate;
  String? avatarUrl;
  late int loginType;
  @JSONField(name: "loginId")
  late String loginId;
  late String extra;
  late String msg;
  @JSONField(name: "_id")
  late String sId;
  late String phoneNumber;
  @JSONField(name: "credit_cards")
  List<TenantLoginInfoCreditCards>? creditCards = null;
  @JSONField(name: "bank_cards")
  List<TenantLoginInfoBankCards>? bankCards = null;
  late String createdAt;
  late String updatedAt;
  late String token;

  TenantLoginInfoEntity();

  factory TenantLoginInfoEntity.fromJson(Map<String, dynamic> json) =>
      $TenantLoginInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $TenantLoginInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TenantLoginInfoAddress {
  String? street;
  String? city;
  String? state;
  String? country;
  String? zip;

  TenantLoginInfoAddress();

  factory TenantLoginInfoAddress.fromJson(Map<String, dynamic> json) =>
      $TenantLoginInfoAddressFromJson(json);

  Map<String, dynamic> toJson() => $TenantLoginInfoAddressToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  String getFullAddress() {
    return "${country}${state}${city}${state}${zip}";
  }
}

@JsonSerializable()
class TenantLoginInfoIdCard {
  @JSONField(name: "id_number")
  String? idNumber;
  String? address;
  String? name;
  String? gender;
  String? birthday;

  TenantLoginInfoIdCard();

  factory TenantLoginInfoIdCard.fromJson(Map<String, dynamic> json) =>
      $TenantLoginInfoIdCardFromJson(json);

  Map<String, dynamic> toJson() => $TenantLoginInfoIdCardToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TenantLoginInfoCreditCards {
  @JSONField(name: "_id")
  late String sId;
  @JSONField(name: "card_number")
  late String cardNumber;
  @JSONField(name: "cardholder_name")
  late String cardholderName;
  @JSONField(name: "expiration_date")
  late String expirationDate;
  @JSONField(name: "security_code")
  late String securityCode;

  TenantLoginInfoCreditCards();

  factory TenantLoginInfoCreditCards.fromJson(Map<String, dynamic> json) =>
      $TenantLoginInfoCreditCardsFromJson(json);

  Map<String, dynamic> toJson() => $TenantLoginInfoCreditCardsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TenantLoginInfoBankCards {
  @JSONField(name: "_id")
  late String sId;
  @JSONField(name: "card_number")
  late String cardNumber;
  @JSONField(name: "cardholder_name")
  late String cardholderName;
  @JSONField(name: "expiration_date")
  String? expirationDate;
  @JSONField(name: "security_code")
  String? securityCode;

  TenantLoginInfoBankCards();

  factory TenantLoginInfoBankCards.fromJson(Map<String, dynamic> json) =>
      $TenantLoginInfoBankCardsFromJson(json);

  Map<String, dynamic> toJson() => $TenantLoginInfoBankCardsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
