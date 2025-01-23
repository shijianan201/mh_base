import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/home_search_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class HomeSearchReqEntity {
  String? houseName = '';
  List<String>? features;
  List<String>? roomSize;
  int? startRent = 0;
  int? endRent = 0;

  HomeSearchReqEntity();

  factory HomeSearchReqEntity.fromJson(Map<String, dynamic> json) =>
      $HomeSearchReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $HomeSearchReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
