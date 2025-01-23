import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_search_contract_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordSearchContractEntity {
  String? houseId = '';
  String? houseName = '';
  String? houseAddress = '';
  List<LandlordSearchContractRooms>? rooms;

  LandlordSearchContractEntity();

  factory LandlordSearchContractEntity.fromJson(Map<String, dynamic> json) =>
      $LandlordSearchContractEntityFromJson(json);

  Map<String, dynamic> toJson() => $LandlordSearchContractEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LandlordSearchContractRooms {
  String? roomId = '';
  String? roomNumber = '';
  String? startTime = '';
  String? endTime = '';
  int? rent = 0;
  String? contractId = '';
  List<String> pictures = [];

  LandlordSearchContractRooms();

  factory LandlordSearchContractRooms.fromJson(Map<String, dynamic> json) =>
      $LandlordSearchContractRoomsFromJson(json);

  Map<String, dynamic> toJson() => $LandlordSearchContractRoomsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
