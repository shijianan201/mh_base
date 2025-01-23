import 'package:flutter/cupertino.dart';
import 'package:landlord_mtech/base/http/http_result.dart';
import 'package:landlord_mtech/base/http/model/loading_config.dart';

import '../../../common/user_manager.dart';
import '../api_request_host.dart';
import '../http_method.dart';
import '../model/request/landlord_login_request_entity.dart';
import '../model/request/landlord_reset_password_request_entity.dart';
import '../model/request/landlord_verifycode_request_entity.dart';
import '../model/request/tenant_add_bank_profile_req_entity.dart';
import '../model/request/tenant_add_id_card_req_entity.dart';
import '../model/request/tenant_delete_bank_profile_req_entity.dart';
import '../model/request/tenant_register_req_entity.dart';
import '../model/request/tenant_update_user_req_entity.dart';
import '../model/tenant_add_idcard_resp_entity.dart';
import '../model/tenant_bank_profile_entity.dart';
import '../model/tenant_login_info_entity.dart';
import 'api_response_service.dart';

class TenantUserService extends ApiResponseService {
  TenantUserService({required super.dio});

  void userLogin(
      ApiRequestHost host, LandlordLoginRequestEntity userLoginRequestEntity,
      {required ValueSetter<TenantLoginInfoEntity> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<TenantLoginInfoEntity>(host, "/user/login", HttpMethod.post,
        data: userLoginRequestEntity.toJson(), onSuccess: (value) {
      UserManager.instance.saveTenantUserInfo(value);
      onSuccess.call(value);
    }, onError: onError, loadingConfig: LoadingConfig());
  }

  void userCreate(ApiRequestHost host, TenantRegisterReqEntity req,
      {required ValueSetter<TenantLoginInfoEntity> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<TenantLoginInfoEntity>(host, "/user/create", HttpMethod.post,
        data: req.toJson(), onSuccess: (value) {
      UserManager.instance.saveTenantUserInfo(value);
      onSuccess.call(value);
    }, onError: onError);
  }

  void updateUserAndAvatar(ApiRequestHost host, TenantUpdateUserReqEntity req,
      {required ValueSetter<TenantLoginInfoEntity> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<dynamic>(host, "/user/update", HttpMethod.post,
        data: req.toJson(), onSuccess: (value) {
      onSuccess.call(value);
    }, onError: onError);
  }
  void deleteUserInfo(ApiRequestHost host,
      {required ValueSetter<dynamic> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<dynamic>(host, "/user/deleteUser", HttpMethod.post,
        data: {}, onSuccess: (value) {
      onSuccess.call(value);
    }, onError: onError);
  }

  void getVerifyCode(ApiRequestHost host,
      LandlordVerifycodeRequestEntity landlordVerifycodeRequestEntity,
      {required ValueSetter<dynamic> onSuccess,
      ValueChanged<dynamic>? onError}) {
    post<dynamic>("/user/verifyCode", host,
            data: landlordVerifycodeRequestEntity.toJson())
        .then((value) {
      onSuccess.call(value);
    }).catchError((error) {
      onError?.call(error);
    });
  }

  void resetPassword(
      ApiRequestHost host, LandlordResetPasswordRequestEntity requestEntity,
      {required ValueSetter<dynamic> onSuccess,
      ValueChanged<dynamic>? onError}) {
    post<dynamic>("/user/updatePassword", host, data: requestEntity.toJson())
        .then((value) {
      onSuccess.call(value);
    }).catchError((error) {
      onError?.call(error);
    });
  }

  void clear(ApiRequestHost host,
      {required ValueSetter<dynamic> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<dynamic>(host, "/user/clearUser", HttpMethod.get,
        onSuccess: onSuccess, onError: onError);
  }

  Future<HttpResult<TenantBankProfileEntity>> getBankProfile(
    ApiRequestHost host,
  ) {
    return doRequestSync<TenantBankProfileEntity>(
        host, "/user/getCards", HttpMethod.get);
  }

  Future<HttpResult<dynamic>> deleteBankProfile(
    ApiRequestHost host,
    TenantDeleteBankProfileReqEntity req,
  ) {
    return doRequestSync<dynamic>(host, "/user/deleteCard", HttpMethod.post,
        data: req.toJson());
  }

  Future<HttpResult<dynamic>> addBankProfile(
    ApiRequestHost host,
    TenantAddBankProfileReqEntity req,
  ) {
    return doRequestSync<dynamic>(host, "/user/addCard", HttpMethod.post,
        data: req.toJson());
  }

  Future<HttpResult<TenantAddIdcardRespEntity>> addIdCard(
    ApiRequestHost host,
    TenantAddIdCardReqEntity req,
  ) {
    return doRequestSync<TenantAddIdcardRespEntity>(
        host, "/user/addIdCard", HttpMethod.post,
        data: req.toJson());
  }
}
