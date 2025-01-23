import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/nfc_upload_voice_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class NfcUploadVoiceReqEntity {
  String? voiceLink = '';
  String? nfcId = '';
  int? times = 0;

  NfcUploadVoiceReqEntity();

  factory NfcUploadVoiceReqEntity.fromJson(Map<String, dynamic> json) =>
      $NfcUploadVoiceReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $NfcUploadVoiceReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
