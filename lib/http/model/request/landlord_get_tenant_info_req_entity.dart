import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_get_tenant_info_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LandlordGetTenantInfoReqEntity {
  late String tenantId;

  LandlordGetTenantInfoReqEntity();

  factory LandlordGetTenantInfoReqEntity.fromJson(Map<String, dynamic> json) =>
      $LandlordGetTenantInfoReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $LandlordGetTenantInfoReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
