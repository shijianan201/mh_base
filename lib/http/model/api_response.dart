
import '../../generated/json/base/json_convert_content.dart';
import '../error/api_error_code.dart';
import '../error/http_error.dart';

class ApiResponse<T> {
  int? code;
  String? message;
  T? data;

  ApiResponse();

  bool isSuccess() {
    return code == ApiErrorCode.success;
  }

  bool isSuccessNoneNull() {
    return isSuccess() && data != null;
  }

  ApiError getApiError() {
    return ApiError(code, message);
  }

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      $ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => $ApiResponseToJson(this);
}

ApiResponse<T> $ApiResponseFromJson<T>(Map<String, dynamic> json) {
  final ApiResponse<T> apiRespEntity = ApiResponse<T>();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    apiRespEntity.code = code;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    apiRespEntity.message = message;
  }
  dynamic dataRes = json['data'];

  if (dataRes is List) {
    if (<String>[] is T) {
      List<String> data = [];
      for (var element in dataRes) {
        data.add("$element");
      }
      apiRespEntity.data = data as T;
      return apiRespEntity;
    }
  }
  final T? data = JsonConvert.fromJsonAsT(dataRes);
  if (data != null) {
    apiRespEntity.data = data;
  }
  return apiRespEntity;
}

Map<String, dynamic> $ApiResponseToJson(ApiResponse response) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = response.code;
  data['message'] = response.message;
  data['data'] = response.data;
  return data;
}
