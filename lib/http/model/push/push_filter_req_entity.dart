import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/push_filter_req_entity.g.dart';
import 'dart:convert';
export 'package:landlord_mtech/generated/json/push_filter_req_entity.g.dart';

@JsonSerializable()
class PushFilterReqEntity {
  int? type = 0;
  int? startTime = 0;
  int? endTime = 0;

  PushFilterReqEntity();

  factory PushFilterReqEntity.fromJson(Map<String, dynamic> json) =>
      $PushFilterReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $PushFilterReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
