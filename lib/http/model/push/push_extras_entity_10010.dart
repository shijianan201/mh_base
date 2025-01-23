import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'dart:convert';

import '../../../../generated/json/push_extras_entity_10010.g.dart';

@JsonSerializable()
class PushExtrasEntity10010 {
  late List<String> pictures;
  late int status;
  @JSONField(name: "_id")
  late String id;
  late String landlordId;
  late String tenantId;
  late String tenantInfo;
  late String roomId;
  late String roomInfo;
  late String repairType;
  late String repairDesc;
  late String createdAt;
  late String updatedAt;
  @JSONField(name: "__v")
  late int v;

  PushExtrasEntity10010();

  factory PushExtrasEntity10010.fromJson(Map<String, dynamic> json) =>
      $PushExtrasEntity10010FromJson(json);

  Map<String, dynamic> toJson() => $PushExtrasEntity10010ToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
