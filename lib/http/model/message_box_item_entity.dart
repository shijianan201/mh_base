import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/message_box_item_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class MessageBoxItemEntity {
  String? houseId = '';
  String? houseName = '';
  int? msgCount = 0;

  MessageBoxItemEntity();

  factory MessageBoxItemEntity.fromJson(Map<String, dynamic> json) =>
      $MessageBoxItemEntityFromJson(json);

  Map<String, dynamic> toJson() => $MessageBoxItemEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
