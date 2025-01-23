import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/update_lock_password_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class UpdateLockPasswordReqEntity {
  List<String>? lockId;
  String? newPassword = '';

  UpdateLockPasswordReqEntity();

  factory UpdateLockPasswordReqEntity.fromJson(Map<String, dynamic> json) =>
      $UpdateLockPasswordReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $UpdateLockPasswordReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
