import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/tenant_bill_history_list_info_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TenantBillHistoryListInfoEntity {
  late String billId;
  late String startTime;
  late double totalMoney;

  TenantBillHistoryListInfoEntity();

  factory TenantBillHistoryListInfoEntity.fromJson(Map<String, dynamic> json) =>
      $TenantBillHistoryListInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $TenantBillHistoryListInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
