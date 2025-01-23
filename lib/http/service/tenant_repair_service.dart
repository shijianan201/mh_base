import 'package:landlord_mtech/base/http/model/loading_config.dart';
import 'package:landlord_mtech/base/http/model/repair_apply_info_entity.dart';
import 'package:landlord_mtech/base/http/model/request/repair_apply_create_req_entity.dart';
import 'package:landlord_mtech/base/http/model/toast_config.dart';

import '../api_request_host.dart';
import '../http_method.dart';
import '../http_result.dart';
import 'api_response_service.dart';

class TenantRepairService extends ApiResponseService {
  TenantRepairService({required super.dio});

  Future<HttpResult<List<String>>> getRepairTypes(
    ApiRequestHost host,
  ) {
    return doRequestSync<List<String>>(
      host,
      "/user/repair/getRepairTypes",
      HttpMethod.get,
      toastConfig: ToastConfig(enableToast: false)
    );
  }

  Future<HttpResult<List<RepairApplyInfoEntity>>> getRepairApplyList(
      ApiRequestHost host, String roomId) {
    return doRequestSync<List<RepairApplyInfoEntity>>(
        host, "/user/repair/getRepairList", HttpMethod.get,
        queryParameters: {"roomId": roomId}, data: {"roomId": roomId});
  }

  Future<HttpResult<RepairApplyInfoEntity>> createRepairApply(
    ApiRequestHost host,
    RepairApplyCreateReqEntity req,
    LoadingConfig loadingConfig,
  ) {
    return doRequestSync<RepairApplyInfoEntity>(
        host, "/user/repair/createRepairRequest", HttpMethod.post,
        loadingConfig: loadingConfig, data: req.toJson());
  }
}
