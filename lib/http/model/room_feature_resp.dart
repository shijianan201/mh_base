import 'dart:convert';

import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/room_feature_resp.g.dart';
import 'package:landlord_mtech/base/http/model/landlord_room_feature_entity.dart';

@JsonSerializable()
class RoomFeatureResp {
  List<LandlordRoomFeatureEntity> roomFeatures = [];
  List<LandlordRoomFeatureEntity> exclusives = [];

  RoomFeatureResp();

  factory RoomFeatureResp.fromJson(Map<String, dynamic> json) =>
      $RoomFeatureRespFromJson(json);

  Map<String, dynamic> toJson() => $RoomFeatureRespToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
