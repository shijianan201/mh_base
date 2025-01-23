import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/upload_lock_voice_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class UploadLockVoiceReqEntity {
  String? voiceLink = '';
  String? lockId = '';
  int? startTime = 0;
  int? endTime = 0;

  UploadLockVoiceReqEntity();

  factory UploadLockVoiceReqEntity.fromJson(Map<String, dynamic> json) =>
      $UploadLockVoiceReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $UploadLockVoiceReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
