import 'package:flutter/cupertino.dart';
import 'package:landlord_mtech/base/http/api_request_host.dart';
import 'package:landlord_mtech/base/http/model/land_lord_login_info_entity.dart';
import 'package:landlord_mtech/base/http/model/loading_config.dart';
import 'package:landlord_mtech/base/http/model/request/landlord_register_request_entity.dart';
import 'package:landlord_mtech/base/http/service/api_response_service.dart';
import 'package:landlord_mtech/common/user_manager.dart';

import '../http_method.dart';
import '../http_result.dart';
import '../model/landlord_home_resp_entity.dart';
import '../model/landlord_user_push_config_entity.dart';
import '../model/push/landlord_home_notification_resp_entity.dart';
import '../model/request/landlord_login_request_entity.dart';
import '../model/request/landlord_reset_password_request_entity.dart';
import '../model/request/landlord_update_push_req_entity.dart';
import '../model/request/landlord_update_user_request_entity.dart';
import '../model/request/landlord_verifycode_request_entity.dart';

class LandlordUserService extends ApiResponseService {
  LandlordUserService({required super.dio});

  void getVerifyCode(ApiRequestHost host,
      LandlordVerifycodeRequestEntity landlordVerifycodeRequestEntity,
      {required ValueSetter<dynamic> onSuccess,
      ValueChanged<dynamic>? onError}) {
    post<dynamic>("/landlord/verifyCode", host,
            loadingConfig: LoadingConfig(),
            data: landlordVerifycodeRequestEntity.toJson())
        .then((value) {
      onSuccess.call(value);
    }).catchError((error) {
      onError?.call(error);
    });
  }

  void register(ApiRequestHost host,
      LandlordRegisterRequestEntity landlordRegisterRequestEntity,
      {required ValueSetter<LandLordLoginInfoEntity> onSuccess,
      ValueChanged<dynamic>? onError}) {
    post<LandLordLoginInfoEntity>("/landlord/create", host,
        loadingConfig: LoadingConfig(),
        data: landlordRegisterRequestEntity.toJson())
        .then((value) {
      UserManager.instance.saveUserInfo(value);
      onSuccess.call(value);
    }).catchError((error) {
      onError?.call(error);
    });
  }

  void userLogin(
      ApiRequestHost host, LandlordLoginRequestEntity userLoginRequestEntity,
      {required ValueSetter<LandLordLoginInfoEntity> onSuccess,
      ValueChanged<dynamic>? onError}) {
    post<LandLordLoginInfoEntity>("/landlord/login", host,
            data: userLoginRequestEntity.toJson(),
            loadingConfig: LoadingConfig(),
            mockAssetsFilePath: "assets/mock/user_login.json")
        .then((value) {
      UserManager.instance.saveUserInfo(value);
      onSuccess.call(value);
    }).catchError((error) {
      onError?.call(error);
    });
  }

  void resetPassword(
      ApiRequestHost host, LandlordResetPasswordRequestEntity requestEntity,
      {required ValueSetter<LandLordLoginInfoEntity> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<LandLordLoginInfoEntity>(
        host, "/landlord/updatePassword", HttpMethod.post,
        loadingConfig: LoadingConfig(),
        data: requestEntity.toJson(), onSuccess: onSuccess, onError: onError);
  }

  void updateUserInfo(ApiRequestHost host, LandlordUpdateUserRequestEntity req,
      {required ValueSetter<LandLordLoginInfoEntity> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<LandLordLoginInfoEntity>(
        host, "/landlord/update", HttpMethod.post,
        loadingConfig: LoadingConfig(),
        data: req.toJson(), onSuccess: onSuccess, onError: onError);
  }

  void deleteUserInfo(ApiRequestHost host, {required ValueSetter<dynamic> onSuccess, ValueChanged<dynamic>? onError}) {
    doRequest<LandLordLoginInfoEntity>(
        host, "/landlord/deleteLandLord", HttpMethod.post,
        loadingConfig: const LoadingConfig(),
        data: {}, onSuccess: onSuccess, onError: onError);
  }


  void clear(ApiRequestHost host,
      {required ValueSetter<dynamic> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<dynamic>(host, "/landlord/clearLandlord", HttpMethod.get,
        onSuccess: onSuccess, onError: onError);
  }

  void getPushSettings(ApiRequestHost host,
      {required ValueSetter<LandlordUserPushConfigEntity> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<LandlordUserPushConfigEntity>(
        host, "/landlord/push/getPushSetting", HttpMethod.get,
        onSuccess: onSuccess, onError: onError);
  }

  void updatePushSettings(ApiRequestHost host, LandlordUpdatePushReqEntity req,
      LoadingConfig? loadingConfig,
      {required ValueSetter<dynamic> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest(host, "/landlord/push/updatePushSetting", HttpMethod.post,
        loadingConfig: loadingConfig,
        data: req.toJson(),
        onSuccess: onSuccess,
        onError: onError);
  }

  Future<HttpResult<LandlordHomeNotificationRespEntity>> getPushList(
    ApiRequestHost host,
  ) {
    return doRequestSync<LandlordHomeNotificationRespEntity>(
      host,
      "/landlord/push/getPushList",
      HttpMethod.get,
    );
  }

  Future<HttpResult<LandlordHomeRespEntity>> getHomeData(
    ApiRequestHost host,
  ) {
    return doRequestSync<LandlordHomeRespEntity>(
      host,
      "/landlord/contract/getHomeInfo",
      HttpMethod.get,
    );
  }
}
