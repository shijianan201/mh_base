import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/tenant_bank_profile_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TenantBankProfileEntity {
  List<TenantBankProfileBank>? credit;
  List<TenantBankProfileBank>? bank;

  TenantBankProfileEntity();

  factory TenantBankProfileEntity.fromJson(Map<String, dynamic> json) =>
      $TenantBankProfileEntityFromJson(json);

  Map<String, dynamic> toJson() => $TenantBankProfileEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TenantBankProfileBank {
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

  TenantBankProfileBank();

  factory TenantBankProfileBank.fromJson(Map<String, dynamic> json) =>
      $TenantBankProfileBankFromJson(json);

  Map<String, dynamic> toJson() => $TenantBankProfileBankToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
