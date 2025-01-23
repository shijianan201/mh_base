import 'package:landlord_mtech/base/http/model/loading_config.dart';

import '../api_request_host.dart';
import '../http_method.dart';
import '../http_result.dart';
import '../model/line_pay_confirm_res_entity.dart';
import '../model/line_pay_res_entity.dart';
import '../model/line_pay_status_resp_entity.dart';
import '../model/request/line_pay_confirm_req_entity.dart';
import '../model/request/line_pay_req_entity.dart';
import '../model/request/line_pay_status_entity.dart';
import 'api_response_service.dart';

class TenantLinePayService extends ApiResponseService {
  TenantLinePayService({required super.dio});

  Future<HttpResult<LinePayResEntity>> payByLineRequestApi(
    ApiRequestHost host, LinePayReqEntity req,
    LoadingConfig loadingConfig,
  ) {
    return doRequestSync(
        host, "/user/contract/payByLineRequestApi", HttpMethod.post,
        loadingConfig: loadingConfig, data: req.toJson());
  }


  Future<HttpResult<LinePayStatusRespEntity>> getPayInfoByOrderId(
      ApiRequestHost host, LinePayStatusEntity req,
      LoadingConfig loadingConfig,
      ) {
    return doRequestSync(
        host, "/user/contract/getPayInfoByOrderId", HttpMethod.post,
        loadingConfig: loadingConfig, data: req.toJson());
  }

  Future<HttpResult<LinePayConfirmResEntity>> payByLineConfirmApi(
      ApiRequestHost host, LinePayConfirmReqEntity req,
      LoadingConfig loadingConfig,
      ) {
    return doRequestSync(
        host, "/user/contract/payByLineConfirmApi", HttpMethod.post,
        loadingConfig: loadingConfig, data: req.toJson());
  }

}
