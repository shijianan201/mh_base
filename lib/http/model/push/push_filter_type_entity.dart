import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/push_filter_type_entity.g.dart';
import 'dart:convert';
export 'package:landlord_mtech/generated/json/push_filter_type_entity.g.dart';

@JsonSerializable()
class PushFilterTypeEntity {
  int? type = 0;
  String? name = '';

  PushFilterTypeEntity();

  factory PushFilterTypeEntity.fromJson(Map<String, dynamic> json) =>
      $PushFilterTypeEntityFromJson(json);

  Map<String, dynamic> toJson() => $PushFilterTypeEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
