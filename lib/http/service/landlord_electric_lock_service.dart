import 'package:landlord_mtech/base/environment.dart';
import 'package:landlord_mtech/base/http/api_request_host.dart';
import 'package:landlord_mtech/base/http/http_method.dart';
import 'package:landlord_mtech/base/http/http_result.dart';
import 'package:landlord_mtech/base/http/model/electric_lock_detail_entity.dart';
import 'package:landlord_mtech/base/http/model/loading_config.dart';
import 'package:landlord_mtech/base/http/model/lock_modify_room_nfc_resp_entity.dart';
import 'package:landlord_mtech/base/http/model/nfc_card_entity.dart';
import 'package:landlord_mtech/base/http/model/request/lock_delete_room_nfc_req_entity.dart';
import 'package:landlord_mtech/base/http/model/request/upload_lock_voice_req_entity.dart';

import '../model/landlord_house_details_entity.dart';
import '../model/request/lock_bind_room_req_entity.dart';
import '../model/request/lock_modify_room_nfc_req_entity.dart';
import '../model/request/lock_room_nfclist_req_entity.dart';
import '../model/update_lock_password_req_entity.dart';
import 'api_response_service.dart';

class LandlordElectricLockService extends ApiResponseService {
  LandlordElectricLockService({required super.dio});

  Future<HttpResult<dynamic>> bindLock2room(
      ApiRequestHost host, LockBindRoomReqEntity req) {
    return doRequestSync(
        host,
        Environment.isPersonalMode()
            ? "/owner/lock/bindLockByRoomId"
            : "/landlord/lock/bindLockByRoomId",
        HttpMethod.post,
        loadingConfig: LoadingConfig(),
        data: req.toJson());
  }

  Future<HttpResult<List<NfcCardEntity>>> getRoomNfcCardList(
      ApiRequestHost host, LockRoomNfclistReqEntity req) {
    return doRequestSync(
        host,
        Environment.isPersonalMode()
            ? "/owner/lock/getNfcCardList"
            : "/landlord/lock/getNfcCardList",
        HttpMethod.post,
        data: req.toJson());
  }

  Future<HttpResult<LockModifyRoomNfcRespEntity>> modifyRoomNfc(
      ApiRequestHost host, LockModifyRoomNfcReqEntity req) {
    return doRequestSync(
        host,
        Environment.isPersonalMode()
            ? "/owner/lock/updateNfcCardById"
            : "/landlord/lock/updateNfcCardById",
        HttpMethod.post,
        loadingConfig: LoadingConfig(),
        data: req.toJson());
  }

  Future<HttpResult<dynamic>> deleteRoomNfc(
      ApiRequestHost host, LockDeleteRoomNfcReqEntity req) {
    return doRequestSync(
        host,
        Environment.isPersonalMode()
            ? "/owner/lock/deleteNfcCardById"
            : "/landlord/lock/deleteNfcCardById",
        HttpMethod.post,
        loadingConfig: LoadingConfig(),
        data: req.toJson());
  }

  Future<HttpResult<dynamic>> deleteRoomAllNfc(
      ApiRequestHost host, LockDeleteRoomNfcReqEntity req) {
    return doRequestSync(
        host,
        Environment.isPersonalMode()
            ? "/owner/lock/deleteAllNfcCard"
            : "/landlord/lock/deleteAllNfcCard",
        HttpMethod.post,
        loadingConfig: LoadingConfig(),
        data: req.toJson());
  }

  Future<HttpResult<String>> getNfcIdByLock(
      ApiRequestHost host, String lockId) {
    return doRequestSync(
        host,
        Environment.isPersonalMode()
            ? "/owner/lock/getNfcIdByLockId"
            : "/landlord/lock/getNfcIdByLockId",
        HttpMethod.post,
        data: {"lockId": lockId});
  }

  Future<HttpResult<LockModifyRoomNfcRespEntity>> bindNfcCard(
      ApiRequestHost host, LockModifyRoomNfcReqEntity req) {
    return doRequestSync(
        host,
        Environment.isPersonalMode()
            ? "/owner/lock/bindNfcCard"
            : "/landlord/lock/bindNfcCard",
        HttpMethod.post,
        loadingConfig: LoadingConfig(),
        data: req.toJson());
  }

  Future<HttpResult<String>> modify(ApiRequestHost host, String lockId) {
    return doRequestSync(
        host,
        Environment.isPersonalMode()
            ? "/owner/lock/getNfcIdByLockId"
            : "/landlord/lock/getNfcIdByLockId",
        HttpMethod.post,
        data: {"lockId": lockId});
  }

  Future<HttpResult<ElectricLockDetailEntity>> getElectricLockDetail(
      ApiRequestHost host, String lockId) async {
    return doRequestSync(
        host,
        Environment.isPersonalMode()
            ? "/owner/lock/getLockDetailByLockId"
            : "/landlord/lock/getLockDetailByLockId",
        HttpMethod.post,
        loadingConfig: LoadingConfig(),
        data: {"lockId": lockId});
  }

  Future<HttpResult<dynamic>> unbindLock(ApiRequestHost host, String lockId,
      String roomId, String? accessKey, bool reBind) async {
    return doRequestSync(
        host,
        Environment.isPersonalMode()
            ? "/owner/lock/unBindLockByRoomId"
            : "/landlord/lock/unBindLockByRoomId",
        HttpMethod.post,
        data: {
          "roomId": roomId,
          "lockId": lockId,
          "accessKey": accessKey,
          "type": reBind ? 2 : 1
        });
  }

  Future<HttpResult<LandlordHouseDetailsEntity>> getHouseDetail(
      ApiRequestHost host, String houseId) async {
    return doRequestSync(
        host,
        Environment.isPersonalMode()
            ? "/owner/lock/getLockInfoFromHouseId"
            : "/landlord/lock/getLockInfoFromHouseId",
        HttpMethod.post,
        loadingConfig: LoadingConfig(),
        data: {"houseId": houseId});
  }

  Future<HttpResult<dynamic>> updateLockPassword(
      ApiRequestHost host, UpdateLockPasswordReqEntity req) async {
    return doRequestSync(
        host,
        Environment.isPersonalMode()
            ? "/owner/lock/updateLockPwd"
            : "/landlord/lock/updateLockPwd",
        HttpMethod.post,
        data: req.toJson(),
        loadingConfig: LoadingConfig());
  }
}
