import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_get_contracts_by_room_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordGetContractsByRoomEntity {
  late String roomId;

  LandlordGetContractsByRoomEntity();

  factory LandlordGetContractsByRoomEntity.fromJson(
          Map<String, dynamic> json) =>
      $LandlordGetContractsByRoomEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      $LandlordGetContractsByRoomEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
