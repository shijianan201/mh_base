import 'package:landlord_mtech/base/http/model/message_box_item_entity.dart';
import 'package:landlord_mtech/base/http/model/request/send_message_req_entity.dart';

import '../api_request_host.dart';
import '../http_method.dart';
import '../http_result.dart';
import '../model/house_unread_message_item_entity.dart';
import '../model/loading_config.dart';
import '../model/push/notification_chat_room_entity.dart';
import '../model/push/notification_message_item_entity.dart';
import '../model/push/push_item_entity.dart';
import 'api_response_service.dart';

class LandlordPushApiService extends ApiResponseService {
  LandlordPushApiService({required super.dio});

  Future<HttpResult<NotificationChatRoomEntity>> getChatRoomProfile(
      ApiRequestHost host,
      String landlordId,
      String tenantId,
      String? roomId,
      LoadingConfig? loadingConfig) {
    return doRequestSync(host, "/landlord/msg/getChatRoomInfo", HttpMethod.post,
        loadingConfig: loadingConfig,
        data: {
          "tenantId": tenantId,
          "landlordId": landlordId,
          "roomId": roomId,
        });
  }

  Future<HttpResult<List<NotificationMessageItemEntity>>>
      getChatRoomMessageList(ApiRequestHost host, String chatRoomId) {
    return doRequestSync(host, "/landlord/msg/getMsgList", HttpMethod.post,
        data: {"chatRoomId": chatRoomId});
  }

  Future<HttpResult<dynamic>> updatePushStatus(
      ApiRequestHost host, String pushId) {
    return doRequestSync(
        host, "/landlord/push/updatePushUserStatus", HttpMethod.post,
        data: {"pushId": pushId});
  }

  Future<HttpResult<dynamic>> alarmPay(ApiRequestHost host, String billId,
      String toId, String contractId, int? electricityType) {
    return doRequestSync(host, "/landlord/push/setBillPush", HttpMethod.post,
        data: {
          "billId": billId,
          "toId": toId,
          "contractId": contractId,
          "electricityType": electricityType
        });
  }

  Future<HttpResult<NotificationMessageItemEntity>> sendMsg(
      ApiRequestHost host, SendMessageReqEntity req) {
    return doRequestSync(host, "/landlord/msg/setMsg", HttpMethod.post,
        loadingConfig: const LoadingConfig(), data: req.toJson());
  }

  Future<HttpResult<List<MessageBoxItemEntity>>> getUnReadMessageList(
      ApiRequestHost host) {
    return doRequestSync(
      host,
      "/landlord/msg/getAllHousingsReserveUnMsg",
      HttpMethod.get,
    );
  }

  Future<HttpResult<List<HouseUnreadMessageItemEntity>>> getUnreadMessage(
      ApiRequestHost host, String houseId) {
    return doRequestSync(host, "/landlord/msg/getRoomsUnMsg", HttpMethod.post,
        data: {"houseId": houseId});
  }
}
