import 'package:flutter/cupertino.dart';
import 'package:landlord_mtech/base/http/http_method.dart';
import 'package:landlord_mtech/base/http/model/land_lord_add_house_config_entity.dart';
import 'package:landlord_mtech/base/http/model/landlord_home_house_entity.dart';
import 'package:landlord_mtech/base/http/model/landlord_pay_bill_resp_entity.dart';
import 'package:landlord_mtech/base/http/model/loading_config.dart';
import 'package:landlord_mtech/base/http/model/request/landlord_create_floors_request_entity.dart';
import 'package:landlord_mtech/base/http/model/room_ids_resp_entity.dart';
import 'package:landlord_mtech/base/http/model/toast_config.dart';

import '../api_request_host.dart';
import '../http_result.dart';
import '../model/add_floor_req_entity.dart';
import '../model/add_room_req_entity.dart';
import '../model/home_search_house_room_entity.dart';
import '../model/landlord_floor_info_by_id_entity.dart';
import '../model/landlord_room_detail_entity.dart';
import '../model/landlord_room_feature_entity.dart';
import '../model/landlord_room_size_entity.dart';
import '../model/request/home_search_req_entity.dart';
import '../model/request/landlord_batch_edit_house_request_entity.dart';
import '../model/request/landlord_delete_house_by_house_id_entity.dart';
import '../model/request/landlord_edit_room_request_entity.dart';
import '../model/request/landlord_floorsinfo_by_id_entity.dart';
import '../model/request/landlord_pay_bill_request_entity.dart';
import '../model/request/landlord_room_detail_request_entity.dart';
import '../model/request/landlord_update_house_request_entity.dart';
import '../model/room_feature_resp.dart';
import 'api_response_service.dart';

class LandlordHouseService extends ApiResponseService {
  LandlordHouseService({required super.dio});

  void getFloorInfoConfig(ApiRequestHost host,
      {required ValueSetter<LandLordAddHouseConfigEntity> onSuccess,
      ValueChanged<dynamic>? onError}) {
    get<LandLordAddHouseConfigEntity>(
      "/landlord/floor/floorInfo",
      host,
    ).then((value) {
      onSuccess.call(value);
    }).catchError((error) {
      onError?.call(error);
    });
  }

  void createFloors(
      ApiRequestHost host, LandlordCreateFloorsRequestEntity requestEntity,
      {required ValueSetter<dynamic> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<dynamic>(host, "/landlord/floor/createFloors", HttpMethod.post,
        data: requestEntity.toJson(), onSuccess: onSuccess, onError: onError);
  }

  void getFloorById(
      ApiRequestHost host, LandlordFloorsInfoByIdEntity requestEntity,
      {required ValueSetter<LandlordFloorInfoByIdEntity> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<LandlordFloorInfoByIdEntity>(
        host, "/landlord/floor/getFloorsInfoByLandlordId", HttpMethod.post,
        data: requestEntity.toJson(), onSuccess: onSuccess, onError: onError);
  }

  Future<HttpResult<List<LandlordPayBillRespEntity>>> getPayBill(
      ApiRequestHost host, LandlordPayBillRequestEntity requestEntity) {
    return doRequestSync<List<LandlordPayBillRespEntity>>(
        host, "/landlord/floor/getPayBill", HttpMethod.post,
        loadingConfig: const LoadingConfig(), data: requestEntity.toJson());
  }

  void getFloorList(ApiRequestHost host,
      {required ValueSetter<List<LandlordHomeHouseEntity>> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<List<LandlordHomeHouseEntity>>(
        host, "/landlord/floor/getFloorList", HttpMethod.get,
        onSuccess: onSuccess, onError: onError);
  }

  void deleteHouse(
      ApiRequestHost host, LandlordDeleteHouseByHouseIdEntity requestEntity,
      {required ValueSetter<dynamic> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<dynamic>(host, "/landlord/floor/deleteHouse", HttpMethod.post,
        data: requestEntity.toJson(), onSuccess: onSuccess, onError: onError);
  }

  Future<HttpResult<List<LandlordHomeHouseEntity>>> getFloorListAsync(
      ApiRequestHost host) {
    return doRequestSync<List<LandlordHomeHouseEntity>>(
        host, "/landlord/floor/getFloorList", HttpMethod.get);
  }

  void updateHouse(ApiRequestHost host, LandlordUpdateHouseRequestEntity req,
      {required ValueSetter<dynamic> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<dynamic>(
        host, "/landlord/floor/editHousingReserveReserveInfo", HttpMethod.post,
        data: req.toJson(), onSuccess: onSuccess, onError: onError);
  }

  void getRoomDetail(ApiRequestHost host, LandlordRoomDetailRequestEntity req,
      {required ValueSetter<LandlordRoomDetailEntity> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<LandlordRoomDetailEntity>(
        host, "/landlord/room/getRoomDetail", HttpMethod.post,
        data: req.toJson(), onSuccess: onSuccess, onError: onError);
  }

  void deleteRoomDetail(
      ApiRequestHost host, LandlordRoomDetailRequestEntity req,
      {required ValueSetter<dynamic> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<dynamic>(host, "/landlord/room/deleteRoomDetail", HttpMethod.post,
        data: req.toJson(), onSuccess: onSuccess, onError: onError);
  }

  void updateRoom(ApiRequestHost host, LandlordEditRoomRequestEntity req,
      LoadingConfig? loadingConfig,
      {required ValueSetter<dynamic> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<dynamic>(host, "/landlord/room/editRoomDetail", HttpMethod.post,
        data: req.toJson(),
        loadingConfig: loadingConfig,
        onSuccess: onSuccess,
        onError: onError);
  }

  void batchUpdateRoom(ApiRequestHost host,
      LandlordBatchEditHouseRequestEntity req, LoadingConfig? loadingConfig,
      {required ValueSetter<dynamic> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<dynamic>(
        host, "/landlord/room/batchEditRoomDetail", HttpMethod.post,
        data: req.toJson(),
        loadingConfig: loadingConfig,
        onSuccess: onSuccess,
        onError: onError);
  }

  void getRoomFeatureList(ApiRequestHost host,
      {required ValueSetter<RoomFeatureResp> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<RoomFeatureResp>(
        host, "/landlord/room/getRoomFeature", HttpMethod.get,
        toastConfig: ToastConfig(enableToast: false),
        onSuccess: onSuccess, onError: onError);
  }

  void getRoomSizeList(ApiRequestHost host,
      {required ValueSetter<List<LandlordRoomSizeEntity>> onSuccess,
      ValueChanged<dynamic>? onError}) {
    doRequest<List<LandlordRoomSizeEntity>>(
        host, "/landlord/room/getRoomSize", HttpMethod.get,
        toastConfig: ToastConfig(enableToast: false),
        onSuccess: onSuccess, onError: onError);
  }

  Future<HttpResult<List<HomeSearchHouseRoomEntity>>> searchRooms(
      ApiRequestHost host, HomeSearchReqEntity req) {
    return doRequestSync<List<HomeSearchHouseRoomEntity>>(
        host, "/landlord/room/searchRooms", HttpMethod.post,
        loadingConfig: LoadingConfig(), data: req.toJson());
  }

  Future<HttpResult<dynamic>> addRoom(
      ApiRequestHost host, AddRoomReqEntity req) {
    return doRequestSync<dynamic>(
        host, "/landlord/room/addRoom", HttpMethod.post,
        loadingConfig: LoadingConfig(), data: req.toJson());
  }

  Future<HttpResult<dynamic>> addFloor(
      ApiRequestHost host, AddFloorReqEntity req) {
    return doRequestSync<dynamic>(
        host, "/landlord/floor/createFloor", HttpMethod.post,
        loadingConfig: LoadingConfig(), data: req.toJson());
  }

  Future<HttpResult<dynamic>> deleteFloor(
      ApiRequestHost host, AddFloorReqEntity req) {
    return doRequestSync<dynamic>(
        host, "/landlord/floor/deleteFloor", HttpMethod.post,
        loadingConfig: LoadingConfig(), data: req.toJson());
  }

  Future<HttpResult<RoomIdsRespEntity>> getAllRoomIds(ApiRequestHost host) {
    return doRequestSync<RoomIdsRespEntity>(
        host, "/landlord/room/getAllRoomIds", HttpMethod.get);
  }
}
