class HttpResult<T> {
  T? response;
  dynamic error;
  int? errorCode;
  String? errorMessage;
  bool success;

  HttpResult(this.success, this.response,
      {dynamic error, this.errorCode, this.errorMessage});

  T getData() {
    assert(response != null);
    return response!;
  }

  bool isEmptyOrNull() {
    if (error != null) {
      return true;
    }
    if (response == null) {
      return true;
    }
    if (response is List) {
      return (response as List).isEmpty;
    }
    return false;
  }

  bool isSuccess() {
    return success;
  }

  static HttpResult<T> getSuccess<T>(T? data) {
    return HttpResult(true, data);
  }

  static HttpResult<T> getError<T>(
      {dynamic error, int? errorCode, String? errorMessage}) {
    return HttpResult(false, null,
        error: error, errorCode: errorCode, errorMessage: errorMessage);
  }

  @override
  String toString() {
    return "$response $error $errorCode $errorMessage";
  }
}
