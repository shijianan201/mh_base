import 'package:landlord_mtech/base/http/model/loading_config.dart';
import 'package:landlord_mtech/base/http/model/request/tenant_lock_req_entity.dart';

import '../api_request_host.dart';
import '../http_method.dart';
import '../http_result.dart';
import '../model/lock_auth_resp_entity.dart';
import '../model/lock_modify_room_nfc_resp_entity.dart';
import '../model/personal/qr_code_resp_entity.dart';
import '../model/request/qr_code_req_entity.dart_entity.dart';
import 'api_response_service.dart';

class TenantElectricLockService extends ApiResponseService {
  TenantElectricLockService({required super.dio});

  Future<HttpResult<LockModifyRoomNfcRespEntity>> modifyPassword(
      ApiRequestHost host, TenantLockReqEntity req) {
    return doRequestSync(host, "/user/lock/updateLockPassword", HttpMethod.post,
        loadingConfig: LoadingConfig(), data: req.toJson());
  }

  Future<HttpResult<LockModifyRoomNfcRespEntity>> deleteRoomNfc(
      ApiRequestHost host, TenantLockReqEntity req) {
    return doRequestSync(host, "/user/lock/deleteNfcCardById", HttpMethod.post,
        data: req.toJson());
  }

  Future<HttpResult<LockModifyRoomNfcRespEntity>> addTempPassword(
      ApiRequestHost host, TenantLockReqEntity req) {
    return doRequestSync(
        host, "/user/lock/addLockTempPassword", HttpMethod.post,
        data: req.toJson());
  }

  Future<HttpResult<List<LockModifyRoomNfcRespTempPassword>>>
      getTempPasswordList(ApiRequestHost host, TenantLockReqEntity req) {
    return doRequestSync(
        host, "/user/lock/getTempPasswordList", HttpMethod.post,
        loadingConfig: LoadingConfig(), data: req.toJson());
  }

  Future<HttpResult<List<LockModifyRoomNfcRespTempPassword>>>
      getElectricLockPasswordList(
          ApiRequestHost host, TenantLockReqEntity req) {
    return doRequestSync(host, "/user/lock/getPasswords", HttpMethod.post,
        data: req.toJson());
  }

  Future<HttpResult<dynamic>> deleteElectricLockPassword(
      ApiRequestHost host, TenantLockReqEntity req) {
    return doRequestSync(host, "/user/lock/deletePassword", HttpMethod.post,
        data: req.toJson());
  }

  Future<HttpResult<LockModifyRoomNfcRespEntity>> addElectricLockPassword(
      ApiRequestHost host, TenantLockReqEntity req) {
    return doRequestSync(host, "/user/lock/addPassword", HttpMethod.post,
        data: req.toJson());
  }

  Future<HttpResult<LockModifyRoomNfcRespEntity>> deleteTempPassword(
      ApiRequestHost host, TenantLockReqEntity req) {
    return doRequestSync(host, "/user/lock/deleteTempPassword", HttpMethod.post,
        loadingConfig: LoadingConfig(), data: req.toJson());
  }

  Future<HttpResult<LockModifyRoomNfcRespEntity>> updateNfcCard(
      ApiRequestHost host, TenantLockReqEntity req) {
    return doRequestSync(host, "/user/lock/updateNfcCardById", HttpMethod.post,
        loadingConfig: LoadingConfig(), data: req.toJson());
  }

  Future<HttpResult<LockModifyRoomNfcRespEntity>> bindNfcCard(
      ApiRequestHost host, TenantLockReqEntity req) {
    return doRequestSync(host, "/user/lock/bindNfcCard", HttpMethod.post,
        data: req.toJson());
  }

  Future<HttpResult<List<LockModifyRoomNfcRespNfcCards>>> getNfcCardList(
      ApiRequestHost host, TenantLockReqEntity req) {
    return doRequestSync(host, "/user/lock/getNfcCardList", HttpMethod.post,
        data: req.toJson());
  }

  Future<HttpResult<LockModifyRoomNfcRespEntity>> deleteNfcCard(
      ApiRequestHost host, TenantLockReqEntity req) {
    return doRequestSync(host, "/user/lock/deleteNfcCardById", HttpMethod.post,
        data: req.toJson());
  }

  Future<HttpResult<int>> getUnlockMode(
      ApiRequestHost host, TenantLockReqEntity req) {
    return doRequestSync(host, "/user/lock/getUnlockMode", HttpMethod.post,
        loadingConfig: LoadingConfig(), data: req.toJson());
  }

  Future<HttpResult<LockModifyRoomNfcRespEntity>> updateUnlockMode(
      ApiRequestHost host, TenantLockReqEntity req) {
    return doRequestSync(host, "/user/lock/updateUnlockModes", HttpMethod.post,
        loadingConfig: LoadingConfig(), data: req.toJson());
  }


  Future<HttpResult<QrCodeRespEntity>> createQrCodeByLockId(
      ApiRequestHost host, QrCodeReqEntity req) {
    return doRequestSync(host, "/user/lock/createQrCodeByLockId", HttpMethod.post,
        loadingConfig: LoadingConfig(), data: req.toJson());
  }

  Future<HttpResult<String>> getNfcIdByLock(
      ApiRequestHost host, String lockId) {
    return doRequestSync(host, "/user/lock/getNfcIdByLockId", HttpMethod.post,
        data: {"lockId": lockId});
  }

  Future<HttpResult<LockAuthRespEntity>> generateAuthCode(
      ApiRequestHost host, String lockId) {
    return doRequestSync(
        host, "/user/lock/createTempAccessKey", HttpMethod.post,
        loadingConfig: LoadingConfig(), data: {"lockId": lockId});
  }
}
