import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/tenant_pay_bill_req_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TenantPayBillReqEntity {
  late List<String> billIds;
  late int paymentType;
  late String paymentAccount;
  String? contractId;
  int? payType;//支付类型 1  line 支付
  String? transactionId;//支付类型 1  line 支付


  TenantPayBillReqEntity();

  factory TenantPayBillReqEntity.fromJson(Map<String, dynamic> json) =>
      $TenantPayBillReqEntityFromJson(json);

  Map<String, dynamic> toJson() => $TenantPayBillReqEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
