import 'package:landlord_mtech/base/http/api_request_host.dart';
import 'package:landlord_mtech/base/http/http_method.dart';
import 'package:landlord_mtech/base/http/model/loading_config.dart';
import 'package:landlord_mtech/base/http/model/repair_provider_info_entity.dart';
import 'package:landlord_mtech/base/http/model/request/repair_add_provider_req_entity.dart';
import 'package:landlord_mtech/base/http/model/request/repair_delete_req_entity.dart';
import 'package:landlord_mtech/tenant/repair/repair_apply_list_page.dart';

import '../http_result.dart';
import '../model/modify_repair_status_resp_entity.dart';
import '../model/repair_apply_info_entity.dart';
import 'api_response_service.dart';

class LandlordRepairService extends ApiResponseService {
  LandlordRepairService({required super.dio});

  Future<HttpResult<List<RepairProviderInfoEntity>>> getRepairShopList(
      ApiRequestHost host) {
    return doRequestSync(
        host, "/landlord/repair/getRepairShops", HttpMethod.get);
  }

  Future<HttpResult<dynamic>> addRepairShop(ApiRequestHost host,
      RepairAddProviderReqEntity req, LoadingConfig loadingConfig) {
    return doRequestSync(
        host, "/landlord/repair/createRepairShop", HttpMethod.post,
        data: req.toJson(), loadingConfig: loadingConfig);
  }

  Future<HttpResult<dynamic>> deleteRepairShop(ApiRequestHost host,
      RepairDeleteReqEntity req, LoadingConfig loadingConfig) {
    return doRequestSync(
        host, "/landlord/repair/deleteRepairShop", HttpMethod.post,
        data: req.toJson(), loadingConfig: loadingConfig);
  }

  Future<HttpResult<ModifyRepairStatusRespEntity>> modifyRepairStatus(
      ApiRequestHost host,
      String repairId,
      int status,
      LoadingConfig loadingConfig) {
    return doRequestSync(
        host, "/landlord/repair/updateRepairStatus", HttpMethod.post,
        data: {"repairId": repairId, "status": status},
        loadingConfig: loadingConfig);
  }

  Future<HttpResult<List<RepairApplyInfoEntity>>> getApplyingRepairList(
      ApiRequestHost host) {
    return doRequestSync(
      host,
      "/landlord/repair/getRepairList",
      HttpMethod.get,
    );
  }

  Future<HttpResult<List<RepairApplyInfoEntity>>> getRepairHistoryRecords(
      ApiRequestHost host, String roomId) {
    return doRequestSync(
        host, "/landlord/repair/getRepairByRoomId", HttpMethod.get,
        queryParameters: {"roomId": roomId});
  }
}
