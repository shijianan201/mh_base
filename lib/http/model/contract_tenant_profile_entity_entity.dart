import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/contract_tenant_profile_entity_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ContractTenantProfileEntityEntity {
  late ContractTenantProfileEntityAddress address;
  @JSONField(name: "id_card")
  ContractTenantProfileEntityIdCard? idCard;
  late String name;
  late String gender;
  late String birthdate;
  late String avatarUrl;
  late String extra;
  late String msg;
  @JSONField(name: "_id")
  late String sId;
  late String phoneNumber;

  ContractTenantProfileEntityEntity();

  factory ContractTenantProfileEntityEntity.fromJson(
          Map<String, dynamic> json) =>
      $ContractTenantProfileEntityEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      $ContractTenantProfileEntityEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ContractTenantProfileEntityAddress {
  late String street;
  late String city;
  late String state;
  late String country;
  late String zip;

  ContractTenantProfileEntityAddress();

  factory ContractTenantProfileEntityAddress.fromJson(
          Map<String, dynamic> json) =>
      $ContractTenantProfileEntityAddressFromJson(json);

  Map<String, dynamic> toJson() =>
      $ContractTenantProfileEntityAddressToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ContractTenantProfileEntityIdCard {
  @JSONField(name: "id_number")
  late String idNumber;
  late String address;
  String? name;
  String? gender;
  String? birthday;

  ContractTenantProfileEntityIdCard();

  factory ContractTenantProfileEntityIdCard.fromJson(
          Map<String, dynamic> json) =>
      $ContractTenantProfileEntityIdCardFromJson(json);

  Map<String, dynamic> toJson() =>
      $ContractTenantProfileEntityIdCardToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
