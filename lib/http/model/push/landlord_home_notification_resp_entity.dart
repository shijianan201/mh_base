import 'package:landlord_mtech/base/http/model/push/push_item_entity.dart';
import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_home_notification_resp_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordHomeNotificationRespEntity {
  List<PushNotificationItemEntity> unRead = [];
  List<PushNotificationItemEntity> read = [];

  LandlordHomeNotificationRespEntity();

  factory LandlordHomeNotificationRespEntity.fromJson(
          Map<String, dynamic> json) =>
      $LandlordHomeNotificationRespEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      $LandlordHomeNotificationRespEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
