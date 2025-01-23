import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/push_filter_item_entity.g.dart';
import 'dart:convert';
export 'package:landlord_mtech/generated/json/push_filter_item_entity.g.dart';

@JsonSerializable()
class PushFilterItemEntity {
  int? type = 0;
  int? pushStatus = 0;
  String? pushTime = '';
  int? pushType = 0;
  int? pushUserType = 0;
  String? toId = '';
  String? fromId = '';
  String? roomId = '';
  String? tenantId = '';
  String? landlordId = '';
  String? chatRoomId = '';
  int? jumpType = 0;
  int? userReadStatus = 0;
  String? extras = '';
  @JSONField(name: "_id")
  String? id = '';
  String? title = '';
  String? content = '';
  String? createdAt = '';
  String? updatedAt = '';

  PushFilterItemEntity();

  factory PushFilterItemEntity.fromJson(Map<String, dynamic> json) =>
      $PushFilterItemEntityFromJson(json);

  Map<String, dynamic> toJson() => $PushFilterItemEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
