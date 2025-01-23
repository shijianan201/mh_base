import 'package:flutter/cupertino.dart';
import 'package:landlord_mtech/base/environment.dart';
import 'package:landlord_mtech/base/http/http_result.dart';
import 'package:landlord_mtech/base/http/model/personal/electric_lock_monitor_history_entity.dart';
import 'package:landlord_mtech/base/http/model/personal/nfc_upload_voice_req_entity.dart';
import 'package:landlord_mtech/base/http/model/personal/personal_message_entity.dart';
import 'package:landlord_mtech/base/http/model/personal/personal_room_info_entity.dart';
import 'package:landlord_mtech/base/http/model/personal_chat_room_profile_entity.dart';
import 'package:landlord_mtech/base/http/model/push/push_filter_item_entity.dart';
import 'package:landlord_mtech/base/http/model/push/push_filter_req_entity.dart';
import 'package:landlord_mtech/base/http/model/push/push_filter_type_entity.dart';
import 'package:landlord_mtech/base/http/model/request/edit_personal_room_req_entity.dart';
import 'package:landlord_mtech/base/http/model/request/personal_create_house_req_entity.dart';
import 'package:landlord_mtech/base/http/model/request/personal_update_house_req_entity.dart';
import 'package:landlord_mtech/base/http/model/request/qr_code_req_entity.dart_entity.dart';
import 'package:landlord_mtech/base/http/model/request/send_message_req_entity.dart';
import 'package:landlord_mtech/base/http/model/toast_config.dart';

import '../../../common/user_manager.dart';
import '../api_request_host.dart';
import '../http_method.dart';
import '../model/land_lord_login_info_entity.dart';
import '../model/landlord_user_push_config_entity.dart';
import '../model/loading_config.dart';
import '../model/lock_modify_room_nfc_resp_entity.dart';
import '../model/personal/personal_clone_lock_req_entity.dart';
import '../model/personal/personal_house_entity.dart';
import '../model/personal/qr_code_resp_entity.dart';
import '../model/push/landlord_home_notification_resp_entity.dart';
import '../model/push/push_item_entity.dart';
import '../model/request/landlord_login_request_entity.dart';
import '../model/request/landlord_register_request_entity.dart';
import '../model/request/landlord_reset_password_request_entity.dart';
import '../model/request/landlord_update_push_req_entity.dart';
import '../model/request/landlord_update_user_request_entity.dart';
import '../model/request/landlord_verifycode_request_entity.dart';
import '../model/request/tenant_lock_req_entity.dart';
import '../model/request/upload_lock_voice_req_entity.dart';
import 'api_response_service.dart';

class PersonalApiService extends ApiResponseService {
  PersonalApiService({required super.dio});

  Future<HttpResult<dynamic>> getVerifyCode(ApiRequestHost host,
      LandlordVerifycodeRequestEntity landlordVerifycodeRequestEntity) async {
    return doRequestSync(host, "/owner/verifyCode", HttpMethod.post,
        data: landlordVerifycodeRequestEntity.toJson());
  }

  Future<HttpResult<LandLordLoginInfoEntity>> register(
    ApiRequestHost host,
    LandlordRegisterRequestEntity landlordRegisterRequestEntity,
  ) async {
    var res = await doRequestSync<LandLordLoginInfoEntity>(
        host, "/owner/create", HttpMethod.post,
        data: landlordRegisterRequestEntity.toJson());
    if (res.success) {
      await UserManager.instance.savePersonalUserInfo(res.getData());
    }
    return res;
  }

  Future<HttpResult<LandLordLoginInfoEntity>> userLogin(
    ApiRequestHost host,
    LandlordLoginRequestEntity userLoginRequestEntity,
  ) async {
    var res = await doRequestSync<LandLordLoginInfoEntity>(
        host, "/owner/login", HttpMethod.post,
        loadingConfig: LoadingConfig(),
        data: userLoginRequestEntity.toJson(),
        toastConfig: ToastConfig());
    if (res.success) {
      await UserManager.instance.savePersonalUserInfo(res.getData());
    }
    return res;
  }

  Future<HttpResult<LandLordLoginInfoEntity>> resetPassword(ApiRequestHost host,
      LandlordResetPasswordRequestEntity requestEntity) async {
    return doRequestSync<LandLordLoginInfoEntity>(
        host, "/owner/updatePassword", HttpMethod.post,
        loadingConfig: LoadingConfig(), data: requestEntity.toJson());
  }

  Future<HttpResult<LandLordLoginInfoEntity>> updateUserInfo(
      ApiRequestHost host, LandlordUpdateUserRequestEntity req) async {
    return doRequestSync<LandLordLoginInfoEntity>(
        host, "/owner/update", HttpMethod.post,
        loadingConfig: LoadingConfig(), data: req.toJson());
  }

  Future<HttpResult<LandLordLoginInfoEntity>> deleteUserInfo(
      ApiRequestHost host) async {
    return doRequestSync<LandLordLoginInfoEntity>(
        host, "/owner/deleteLandLord", HttpMethod.post,
        loadingConfig: const LoadingConfig(), data: {});
  }

  Future<HttpResult<dynamic>> clear(ApiRequestHost host) async {
    return doRequestSync<dynamic>(host, "/owner/clearLandlord", HttpMethod.get);
  }

  Future<HttpResult<List<PersonalHouseEntity>>> getHouseList(
      ApiRequestHost host) async {
    return doRequestSync<List<PersonalHouseEntity>>(
        host, "/owner/house/getHousingList", HttpMethod.post,
        loadingConfig: null, data: {});
  }

  Future<HttpResult<PersonalHouseEntity>> createHouse(
      ApiRequestHost host, PersonalCreateHouseReqEntity req) async {
    return doRequestSync<PersonalHouseEntity>(
        host, "/owner/house/createHousing", HttpMethod.post,
        loadingConfig: const LoadingConfig(), data: req.toJson());
  }

  Future<HttpResult<PersonalHouseEntity>> getHouseInfo(
      ApiRequestHost host, String houseId, LoadingConfig? loadingConfig) async {
    return doRequestSync<PersonalHouseEntity>(
        host, "/owner/house/getHouseInfo", HttpMethod.post,
        loadingConfig: loadingConfig, data: {"houseId": houseId});
  }

  Future<HttpResult<PersonalHouseEntity>> updateHouseInfo(
      ApiRequestHost host, PersonalUpdateHouseReqEntity req) async {
    return doRequestSync<PersonalHouseEntity>(
        host, "/owner/house/editHousingInfo", HttpMethod.post,
        loadingConfig: const LoadingConfig(), data: req.toJson());
  }

  Future<HttpResult<dynamic>> deleteHouse(
      ApiRequestHost host, String houseId) async {
    return doRequestSync<dynamic>(
        host, "/owner/house/deleteHouse", HttpMethod.post,
        loadingConfig: const LoadingConfig(), data: {"houseId": houseId});
  }

  Future<HttpResult<dynamic>> addRoom(
      ApiRequestHost host, EditPersonalRoomReqEntity req) async {
    return doRequestSync<dynamic>(host, "/owner/room/addRoom", HttpMethod.post,
        loadingConfig: const LoadingConfig(), data: req.toJson());
  }

  Future<HttpResult<dynamic>> updateRoom(
      ApiRequestHost host, EditPersonalRoomReqEntity req) async {
    return doRequestSync<dynamic>(
        host, "/owner/room/editRoomDetail", HttpMethod.post,
        loadingConfig: const LoadingConfig(), data: req.toJson());
  }

  Future<HttpResult<dynamic>> deleteRoom(
      ApiRequestHost host, String roomId) async {
    return doRequestSync<dynamic>(
        host, "/owner/room/deleteRoomDetail", HttpMethod.post,
        loadingConfig: const LoadingConfig(), data: {"roomId": roomId});
  }

  Future<HttpResult<PersonalRoomInfoEntity>> getRoomInfo(
      ApiRequestHost host, String roomId, LoadingConfig loadingConfig) async {
    return doRequestSync<PersonalRoomInfoEntity>(
        host, "/owner/room/getRoomDetail", HttpMethod.post,
        loadingConfig: const LoadingConfig(), data: {"roomId": roomId});
  }

  Future<HttpResult<dynamic>> deleteMember(
      ApiRequestHost host, String houseId, String memberId) async {
    return doRequestSync<dynamic>(
        host, "/owner/house/deleteHouseMember", HttpMethod.post,
        loadingConfig: const LoadingConfig(),
        data: {"houseId": houseId, "memberId": memberId});
  }

  Future<HttpResult<dynamic>> deleteRoomMember(
      ApiRequestHost host, String roomId, String memberId) async {
    return doRequestSync<dynamic>(
        host, "/owner/room/deleteRoomMember", HttpMethod.post,
        loadingConfig: const LoadingConfig(),
        data: {"roomId": roomId, "memberId": memberId});
  }

  Future<HttpResult<dynamic>> addMember(
      ApiRequestHost host, String houseId, String memberId) async {
    return doRequestSync<dynamic>(
        host, "/owner/house/addHouseMember", HttpMethod.post,
        loadingConfig: const LoadingConfig(),
        data: {"houseId": houseId, "memberId": memberId});
  }

  Future<HttpResult<LandlordUserPushConfigEntity>> getPushSettings(
      ApiRequestHost host) async {
    return doRequestSync<LandlordUserPushConfigEntity>(
        host, "/owner/push/getPushSetting", HttpMethod.get);
  }

  Future<HttpResult<dynamic>> updatePushSettings(
    ApiRequestHost host,
    LandlordUpdatePushReqEntity req,
    LoadingConfig? loadingConfig,
  ) {
    return doRequestSync<dynamic>(
      host,
      "/owner/push/updatePushSetting",
      HttpMethod.post,
      loadingConfig: loadingConfig,
      data: req.toJson(),
    );
  }

  Future<HttpResult<LandlordHomeNotificationRespEntity>> getPushList(
    ApiRequestHost host,
  ) {
    return doRequestSync<LandlordHomeNotificationRespEntity>(
      host,
      "/owner/push/getPushList",
      HttpMethod.get,
    );
  }

  Future<HttpResult<dynamic>> updatePushStatus(
      ApiRequestHost host, String pushId) {
    return doRequestSync(
        host, "/owner/push/updatePushUserStatus", HttpMethod.post,
        data: {"pushId": pushId});
  }

  Future<HttpResult<List<PersonalChatRoomProfileEntity>>> getChatRoomList(
    ApiRequestHost host,
  ) {
    return doRequestSync<List<PersonalChatRoomProfileEntity>>(
      host,
      "/owner/msg/getChatRoomList",
      HttpMethod.post,
    );
  }

  Future<HttpResult<List<ElectricLockMonitorHistoryEntity>>>
      getLockMonitorHistory(ApiRequestHost host, String lockId) {
    return doRequestSync<List<ElectricLockMonitorHistoryEntity>>(
        host, "/owner/room/getRoomCheckRecordByLockId", HttpMethod.post,
        data: {"lockId": lockId});
  }

  Future<HttpResult<dynamic>> deleteChatRoom(
      ApiRequestHost host, String chatRoomId) {
    return doRequestSync(host, "/owner/msg/deleteChatRoom", HttpMethod.post,
        data: {"chatRoomId": chatRoomId});
  }

  Future<HttpResult<dynamic>> uploadVoice(
      ApiRequestHost host, NfcUploadVoiceReqEntity req) {
    return doRequestSync(host, "/owner/lock/updateVoice", HttpMethod.post,
        data: req.toJson());
  }

  Future<HttpResult<PersonalChatRoomProfileEntity>> createChatRoom(
      ApiRequestHost host, String friendId) {
    return doRequestSync<PersonalChatRoomProfileEntity>(
        host, "/owner/msg/createChatRoom", HttpMethod.post,
        loadingConfig: LoadingConfig(), data: {"friendId": friendId});
  }

  Future<HttpResult<PersonalChatRoomProfileEntity>> getChatRoomProfile(
      ApiRequestHost host, String friendId) {
    return doRequestSync<PersonalChatRoomProfileEntity>(
        host, "/owner/msg/getChatRoomInfo", HttpMethod.post,
        loadingConfig: LoadingConfig(), data: {"friendId": friendId});
  }

  Future<HttpResult<List<PersonalMessageEntity>>> getMessageList(
      ApiRequestHost host, String chatRoomId) {
    return doRequestSync<List<PersonalMessageEntity>>(
        host, "/owner/msg/getMsgList", HttpMethod.post,
        data: {"chatRoomId": chatRoomId});
  }

  Future<HttpResult<PersonalMessageEntity>> sendMessage(
      ApiRequestHost host, SendMessageReqEntity req) {
    return doRequestSync<PersonalMessageEntity>(
        host, "/owner/msg/setMsg", HttpMethod.post,
        loadingConfig: LoadingConfig(), data: req.toJson());
  }

  Future<HttpResult<PersonalMessageEntity>> receiveHouseManageInvite(
      ApiRequestHost host, String msgId, int status) {
    return doRequestSync<PersonalMessageEntity>(
        host, "/owner/msg/updateMsgStatus", HttpMethod.post,
        loadingConfig: LoadingConfig(),
        data: {"msgId": msgId, "status": status});
  }

  Future<HttpResult<dynamic>> deleteUser(ApiRequestHost host) {
    return doRequestSync<dynamic>(host, "/owner/deleteOwner", HttpMethod.post,
        loadingConfig: const LoadingConfig());
  }

  Future<HttpResult<dynamic>> cloneElectricLock(
      ApiRequestHost host, PersonalCloneLockReqEntity req) {
    return doRequestSync<dynamic>(
        host, "/owner/lock/cloneBindLockByRoomId", HttpMethod.post,
        data: req.toJson(), loadingConfig: const LoadingConfig());
  }

  Future<HttpResult<PersonalHouseEntity>> getHouseDetail(
      ApiRequestHost host, String houseId) async {
    return doRequestSync<PersonalHouseEntity>(
        host, "/owner/lock/getLockInfoFromHouseId", HttpMethod.post,
        loadingConfig: LoadingConfig(), data: {"houseId": houseId});
  }

  Future<HttpResult<int>> getUnlockMode(
      ApiRequestHost host, TenantLockReqEntity req) {
    return doRequestSync<int>(host, "/owner/lock/getUnlockMode", HttpMethod.post,
        loadingConfig: LoadingConfig(), data: req.toJson());
  }

  Future<HttpResult<LockModifyRoomNfcRespEntity>> updateUnlockMode(
      ApiRequestHost host, TenantLockReqEntity req) {
    return doRequestSync(host, "/owner/lock/updateUnlockModes", HttpMethod.post,
        loadingConfig: LoadingConfig(), data: req.toJson());
  }

  Future<HttpResult<dynamic>> updateLockWallpaper(
      ApiRequestHost host, String lockId, String wallpaper) {
    return doRequestSync<dynamic>(
        host,
        Environment.isPersonalMode()
            ? "/owner/lock/updateWallpaper"
            : "/landlord/lock/updateWallpaper",
        HttpMethod.post,
        data: {"lockId": lockId, "wallpaper": wallpaper},
        loadingConfig: const LoadingConfig());
  }

  Future<HttpResult<dynamic>> uploadElectricLockVoice(
      ApiRequestHost host, UploadLockVoiceReqEntity req) {
    return doRequestSync(
        host, "/owner/lock/updateVoiceByLockId", HttpMethod.post,
        data: req.toJson());
  }



  // 生成临时开锁密码
  Future<HttpResult<QrCodeRespEntity>> createQrCodeByLockId(
      ApiRequestHost host, QrCodeReqEntity req) {
    return doRequestSync(
        host, "/owner/lock/createQrCodeByLockId", HttpMethod.post,
        data: req.toJson());
  }

  Future<HttpResult<List<PushNotificationItemEntity>>> getFilterPushList(
      ApiRequestHost host, PushFilterReqEntity req) {
    return doRequestSync<List<PushNotificationItemEntity>>(
        host, "/owner/push/getPushListByTimeAndType", HttpMethod.post,
        data: req.toJson());
  }

  Future<HttpResult<List<PushFilterTypeEntity>>> getFilterTypeList(
    ApiRequestHost host,
  ) {
    return doRequestSync<List<PushFilterTypeEntity>>(
        host, "/owner/push/getPushType", HttpMethod.get);
  }
}
