import 'package:landlord_mtech/base/util/text_util.dart';
import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/land_lord_login_info_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandLordLoginInfoEntity {
  String? avatarUrl;
  String? address;
  int? notification;
  String? extra;
  bool isCreateHousingReserve = false;
  @JSONField(name: "_id")
  late String sId;
  String? name;
  String? phoneNumber;
  int? loginType;
  String createdAt = "";
  String updatedAt = "";
  String? token;
  String? bindingCode;
  String? email;

  LandLordLoginInfoEntity();

  factory LandLordLoginInfoEntity.fromJson(Map<String, dynamic> json) =>
      $LandLordLoginInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $LandLordLoginInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
