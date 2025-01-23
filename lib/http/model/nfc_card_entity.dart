import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/nfc_card_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class NfcCardEntity {
  @JSONField(name: "_id")
  String sId = "";
  late String nfcId;
  late String nfcName;
  String? voice;
  int? voiceTime;
  String? createdAt;

  NfcCardEntity();

  factory NfcCardEntity.fromJson(Map<String, dynamic> json) =>
      $NfcCardEntityFromJson(json);

  Map<String, dynamic> toJson() => $NfcCardEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
