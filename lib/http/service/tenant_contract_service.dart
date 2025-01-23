import 'package:landlord_mtech/base/http/api_request_host.dart';
import 'package:landlord_mtech/base/http/http_method.dart';
import 'package:landlord_mtech/base/http/model/loading_config.dart';
import 'package:landlord_mtech/base/http/model/request/landlord_update_contract_req_entity.dart';
import 'package:landlord_mtech/base/http/model/request/tenant_pay_bill_req_entity.dart';
import 'package:landlord_mtech/base/http/model/request/tenant_update_electric_req_entity.dart';
import 'package:landlord_mtech/base/http/model/tenant_bill_detail_entity.dart';
import 'package:landlord_mtech/base/http/model/tenant_electric_info_entity.dart';

import '../http_result.dart';
import '../model/request/landlord_get_payment_status_req_entity.dart';
import '../model/request/tenant_get_electric_req_entity.dart';
import '../model/tenant_bill_history_list_info_entity.dart';
import '../model/tenant_bill_info_entity.dart';
import '../model/tenant_contract_detail_resp_entity.dart';
import '../model/tenant_contract_info_entity.dart';
import '../model/tenant_home_contract_info_entity.dart';
import '../model/tenant_update_electric_resp_entity.dart';
import 'api_response_service.dart';

class TenantContractService extends ApiResponseService {
  TenantContractService({required super.dio});

  Future<HttpResult<List<TenantContractInfoEntity>>> getContractList(
      ApiRequestHost host) {
    return doRequestSync(
        host, "/user/contract/getContractsById", HttpMethod.get);
  }

  Future<HttpResult<TenantContractInfoEntity>> updateContract(
      ApiRequestHost host,
      LandlordUpdateContractReqEntity req,
      LoadingConfig loadingConfig) {
    return doRequestSync(host, "/user/contract/updateContract", HttpMethod.post,
        loadingConfig: loadingConfig, data: req.toJson());
  }

  Future<HttpResult<List<TenantBillInfoEntity>>> getBillList(
      ApiRequestHost host) {
    return doRequestSync(host, "/user/contract/getBills", HttpMethod.get);
  }

  Future<HttpResult<List<TenantBillInfoEntity>>> getContractBillList(
      ApiRequestHost host, LandlordGetPaymentStatusReqEntity req) {
    return doRequestSync(
        host, "/user/contract/getBillByContractId", HttpMethod.get,
        queryParameters: req.toJson());
  }

  Future<HttpResult<List<TenantHomeContractInfoEntity>>> getHomeContractList(
      ApiRequestHost? host) {
    return doRequestSync(
        host, "/user/contract/getContractList", HttpMethod.get);
  }

  Future<HttpResult<List<TenantContractInfoEntity>>> getContractsByRoom(
      ApiRequestHost? host, String roomId) {
    return doRequestSync(
        host, "/user/contract/getContractsByRoomId", HttpMethod.get,
        queryParameters: {"roomId": roomId});
  }

  Future<HttpResult<dynamic>> payBill(
      ApiRequestHost host, TenantPayBillReqEntity req) {
    return doRequestSync(host, "/user/contract/payBill", HttpMethod.post,
        data: req.toJson(), loadingConfig: LoadingConfig());
  }

  Future<HttpResult<dynamic>> payFirstBill(
      ApiRequestHost host, TenantPayBillReqEntity req) {
    return doRequestSync(host, "/user/contract/payFirstBill", HttpMethod.post,
        data: req.toJson(), loadingConfig: LoadingConfig());
  }

  Future<HttpResult<TenantElectricInfoEntity>> getElectricInfo(
      ApiRequestHost host, TenantGetElectricReqEntity req) {
    return doRequestSync(
        host, "/user/contract/getElectricityInfo", HttpMethod.post,
        data: req.toJson(), loadingConfig: LoadingConfig());
  }

  Future<HttpResult<TenantHomeContractInfoBills>> getContractCurrentBill(
      ApiRequestHost host, String contractId) {
    return doRequestSync(
        host, "/user/contract/getCurrentBillByContractId", HttpMethod.get,
        queryParameters: {"contractId": contractId});
  }

  Future<HttpResult<TenantBillDetailEntity>> getContractBillDetail(
      ApiRequestHost host, String contractId) {
    return doRequestSync<TenantBillDetailEntity>(
        host, "/user/contract/getBillHistoryDetailByContractId", HttpMethod.get,
        loadingConfig: LoadingConfig(),
        queryParameters: {"billId": contractId});
  }

  Future<HttpResult<List<TenantBillHistoryListInfoEntity>>>
      getContractHistoryBillList(ApiRequestHost host, String contractId) {
    return doRequestSync(
        host, "/user/contract/getBillHistoryByContractId", HttpMethod.get,
        queryParameters: {"contractId": contractId});
  }

  Future<HttpResult<TenantUpdateElectricRespEntity>> updateElectricInfo(
      ApiRequestHost host, TenantUpdateElectricReqEntity req) {
    return doRequestSync<TenantUpdateElectricRespEntity>(
        host, "/user/contract/upDateElectricityBill", HttpMethod.post,
        data: req.toJson(), loadingConfig: LoadingConfig());
  }

  Future<HttpResult<TenantContractDetailRespEntity>> getContractDetail(
      ApiRequestHost host, String contractId) {
    return doRequestSync(host, "/user/contract/getContractById", HttpMethod.get,
        queryParameters: {"contractId": contractId},
        loadingConfig: LoadingConfig());
  }

  Future<HttpResult<dynamic>> renewContract(
      ApiRequestHost host, String contractId, int months) {
    return doRequestSync(host, "/user/contract/renewContract", HttpMethod.post,
        data: {"contractId": contractId, "months": months},
        loadingConfig: LoadingConfig());
  }

  Future<HttpResult<dynamic>> terminateContract(
      ApiRequestHost host, String contractId, DateTime? dateTime) {
    return doRequestSync(
        host, "/user/contract/setContractTerminated", HttpMethod.post,
        data: {
          "contractId": contractId,
          "terminationTime": "${dateTime?.millisecondsSinceEpoch ?? 0}"
        },
        loadingConfig: LoadingConfig());
  }
}
