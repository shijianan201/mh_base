import 'package:flutter/cupertino.dart';
import 'package:landlord_mtech/base/console_logger.dart';
import 'package:landlord_mtech/base/http/http_result.dart';
import 'package:landlord_mtech/base/http/model/loading_config.dart';
import 'package:landlord_mtech/base/http/model/request/landlord_create_contract_req_entity.dart';
import 'package:landlord_mtech/base/http/model/request/landlord_get_payment_status_req_entity.dart';
import 'package:landlord_mtech/base/http/model/request/landlord_update_contract_req_entity.dart';
import 'package:landlord_mtech/base/http/model/request/urge_contract_pay_req_entity.dart';
import 'package:landlord_mtech/base/http/service/api_response_service.dart';

import '../api_request_host.dart';
import '../http_method.dart';
import '../model/contract_payment_status_resp_entity.dart';
import '../model/contract_tenant_profile_entity_entity.dart';
import '../model/landlord_contract_manage_filter_entity.dart';
import '../model/landlord_create_contract_resp_entity.dart';
import '../model/landlord_room_contract_entity.dart';
import '../model/landlord_room_detail_entity.dart';
import '../model/landlord_search_bill_entity.dart';
import '../model/landlord_search_contract_entity.dart';
import '../model/request/landlord_contract_manage_rooms_req_entity.dart';
import '../model/request/landlord_get_contracts_by_room_entity.dart';
import '../model/request/landlord_get_tenant_info_req_entity.dart';
import '../model/request/landlord_update_contract_authstatus_req_entity.dart';
import '../model/tenant_bill_detail_entity.dart';
import '../model/tenant_bill_history_list_info_entity.dart';
import '../model/tenant_home_contract_info_entity.dart';

class LandlordContractService extends ApiResponseService {
  LandlordContractService({required super.dio});

  Future<HttpResult<List<LandlordRoomContractEntity>>> getWaitPayContractList(
      ApiRequestHost host) {
    return doRequestSync(
        host, "/landlord/contract/getUnPaidContracts", HttpMethod.get);
  }

  Future<HttpResult<dynamic>> urgeContractPay(
      ApiRequestHost host, UrgeContractPayReqEntity req) {
    return doRequestSync(
        host, "/landlord/contract/sendRentReminder", HttpMethod.post,
        data: req.toJson());
  }

  Future<HttpResult<dynamic>> updateContractSync(
      ApiRequestHost host, LandlordUpdateContractReqEntity req) {
    return doRequestSync<dynamic>(
        host, "/landlord/contract/updateContract", HttpMethod.post,
        loadingConfig: LoadingConfig(), data: req.toJson());
  }

  void getRoomContractsList(
      ApiRequestHost host, LandlordGetContractsByRoomEntity req,
      {required ValueSetter<List<LandlordRoomContractEntity>> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<List<LandlordRoomContractEntity>>(
        host, "/landlord/contract/getContractsById", HttpMethod.get,
        queryParameters: req.toJson(),
        data: req.toJson(),
        onSuccess: onSuccess,
        onError: onError);
  }

  void getContractManageFilter(ApiRequestHost host,
      {required ValueSetter<List<LandlordContractManageFilterEntity>> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<List<LandlordContractManageFilterEntity>>(
        host, "/landlord/contract/getHousingList", HttpMethod.get,
        onSuccess: onSuccess, onError: onError);
  }

  void getContractManageRooms(
      ApiRequestHost host, LandlordContractManageRoomsReqEntity req,
      {required ValueSetter<List<LandlordRoomDetailEntity>> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<List<LandlordRoomDetailEntity>>(
        host, "/landlord/contract/getRoomList", HttpMethod.get,
        queryParameters: req.toJson(),
        data: req.toJson(),
        onSuccess: onSuccess,
        onError: onError);
  }

  void getContractTenantProfile(
      ApiRequestHost host, LandlordGetTenantInfoReqEntity req,
      {required ValueSetter<ContractTenantProfileEntityEntity> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<ContractTenantProfileEntityEntity>(
        host, "/landlord/contract/getTenantInfoById", HttpMethod.get,
        queryParameters: req.toJson(), onSuccess: onSuccess, onError: onError);
  }

  void createContract(ApiRequestHost host, LandlordCreateContractReqEntity req,
      {required ValueSetter<LandlordCreateContractRespEntity> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<LandlordCreateContractRespEntity>(
        host, "/landlord/contract/createContract", HttpMethod.post,
        data: req.toJson(), onSuccess: onSuccess, onError: onError);
  }

  void updateContract(ApiRequestHost host, LandlordUpdateContractReqEntity req,
      {required ValueSetter<dynamic> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<dynamic>(
        host, "/landlord/contract/updateContract", HttpMethod.post,
        data: req.toJson(), onSuccess: onSuccess, onError: onError);
  }

  Future<HttpResult<ContractPaymentStatusRespEntity>> getPaymentStatus(
      ApiRequestHost host, LandlordGetPaymentStatusReqEntity req) {
    return doRequestSync(
        host, "/landlord/contract/getPaymentStatus", HttpMethod.get,
        queryParameters: req.toJson());
  }

  Future<HttpResult<dynamic>> updateContractAuthStatus(
      ApiRequestHost host,
      LandlordUpdateContractAuthstatusReqEntity req,
      LoadingConfig loadingConfig) {
    return doRequestSync(
        data: req.toJson(),
        host,
        "/landlord/contract/updateContractAuthorizationStatus",
        loadingConfig: loadingConfig,
        HttpMethod.post);
  }

  Future<HttpResult<dynamic>> renewContract(
      ApiRequestHost host, String contractId, bool renewContract) {
    return doRequestSync(
        data: {
          "renewContract": renewContract ? 2 : 0,
          "contractId": contractId
        },
        host,
        "/landlord/contract/renewContract",
        loadingConfig: LoadingConfig(),
        HttpMethod.post);
  }

  Future<HttpResult<dynamic>> terminateContract(
      ApiRequestHost host, String contractId, int terminationStatus) {
    return doRequestSync(
        data: {
          "terminationStatus": terminationStatus,
          "contractId": contractId
        },
        host,
        "/landlord/contract/setContractTerminated",
        loadingConfig: LoadingConfig(),
        HttpMethod.post);
  }

  Future<HttpResult<List<LandlordSearchContractEntity>>>
      getSearchRunningContract(ApiRequestHost host) {
    return doRequestSync(
        host, "/landlord/contract/getActiveContracts", HttpMethod.get);
  }

  Future<HttpResult<List<LandlordSearchContractEntity>>>
      getSearchWillOverdueContract(ApiRequestHost host) {
    return doRequestSync(
        host, "/landlord/contract/getExpiringContracts", HttpMethod.get);
  }

  Future<HttpResult<List<LandlordSearchBillEntity>>> getSearchUnpaidContract(
      ApiRequestHost host) {
    return doRequestSync(
        host, "/landlord/contract/getOverdueContracts", HttpMethod.get);
  }

  Future<HttpResult<List<TenantBillHistoryListInfoEntity>>>
      getContractHistoryBillList(ApiRequestHost host, String contractId) {
    return doRequestSync(
        host, "/landlord/contract/getBillHistoryByContractId", HttpMethod.get,
        queryParameters: {"contractId": contractId});
  }

  Future<HttpResult<TenantHomeContractInfoBills>> getContractCurrentBill(
      ApiRequestHost host, String contractId) {
    return doRequestSync(
        host, "/landlord/contract/getCurrentBillByContractId", HttpMethod.get,
        queryParameters: {"contractId": contractId});
  }

  Future<HttpResult<TenantBillDetailEntity>> getContractBillDetail(
      ApiRequestHost host, String billId) {
    return doRequestSync<TenantBillDetailEntity>(
        host, "/user/contract/getBillHistoryDetailByContractId", HttpMethod.get,
        loadingConfig: LoadingConfig(), queryParameters: {"billId": billId});
  }
}
