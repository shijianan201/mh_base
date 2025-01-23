import 'package:landlord_mtech/base/http/model/request/send_message_req_entity.dart';

import '../api_request_host.dart';
import '../http_method.dart';
import '../http_result.dart';
import '../model/loading_config.dart';
import '../model/push/landlord_home_notification_resp_entity.dart';
import '../model/push/notification_chat_room_entity.dart';
import '../model/push/notification_message_item_entity.dart';
import '../model/push/push_filter_item_entity.dart';
import '../model/push/push_filter_req_entity.dart';
import '../model/push/push_filter_type_entity.dart';
import '../model/push/push_item_entity.dart';
import 'api_response_service.dart';

class TenantPushApiService extends ApiResponseService {
  TenantPushApiService({required super.dio});

  Future<HttpResult<NotificationChatRoomEntity>> getChatRoomProfile(
      ApiRequestHost host,
      String landlordId,
      String tenantId,
      String? roomId,
      LoadingConfig loadingConfig) {
    return doRequestSync(host, "/user/msg/getChatRoomInfo", HttpMethod.post,
        loadingConfig: loadingConfig,
        data: {
          "tenantId": tenantId,
          "landlordId": landlordId,
          "roomId": roomId,
        });
  }

  Future<HttpResult<List<NotificationMessageItemEntity>>>
      getChatRoomMessageList(ApiRequestHost host, String chatRoomId) {
    return doRequestSync(host, "/user/msg/getMsgList", HttpMethod.post,
        data: {"chatRoomId": chatRoomId});
  }

  Future<HttpResult<dynamic>> updatePushStatus(
      ApiRequestHost host, String pushId) {
    return doRequestSync(
        host, "/user/push/updatePushUserStatus", HttpMethod.post,
        data: {"pushId": pushId});
  }

  Future<HttpResult<NotificationMessageItemEntity>> sendMsg(
      ApiRequestHost host, SendMessageReqEntity req) {
    return doRequestSync(host, "/user/msg/setMsg", HttpMethod.post,
        loadingConfig: LoadingConfig(), data: req.toJson());
  }

  Future<HttpResult<LandlordHomeNotificationRespEntity>> getPushList(
    ApiRequestHost host,
  ) {
    return doRequestSync<LandlordHomeNotificationRespEntity>(
      host,
      "/user/push/getPushList",
      HttpMethod.get,
    );
  }

  Future<HttpResult<List<PushNotificationItemEntity>>> getFilterPushList(
      ApiRequestHost host, PushFilterReqEntity req) {
    return doRequestSync<List<PushNotificationItemEntity>>(
        host, "/user/push/getPushListByTimeAndType", HttpMethod.post,
        data: req.toJson());
  }

  Future<HttpResult<List<PushFilterTypeEntity>>> getFilterTypeList(
      ApiRequestHost host) {
    return doRequestSync<List<PushFilterTypeEntity>>(
        host, "/user/push/getPushType", HttpMethod.get);
  }
}
