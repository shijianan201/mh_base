import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_room_feature_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordRoomFeatureEntity {
  @JSONField(name: "_id")
  late String sId;
  late String feature;
  @JSONField(serialize: false, deserialize: false)
  List<LandlordRoomFeatureEntity> exclusiveFeatureIdList = [];

  LandlordRoomFeatureEntity();

  factory LandlordRoomFeatureEntity.fromJson(Map<String, dynamic> json) =>
      $LandlordRoomFeatureEntityFromJson(json);

  Map<String, dynamic> toJson() => $LandlordRoomFeatureEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
