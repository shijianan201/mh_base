class InvokeResult<T> {
  bool success;
  T? data;
  dynamic error;
  String? errorMessage;

  InvokeResult(this.success, {this.data, this.error,this.errorMessage});

  static InvokeResult<T> getErrorResult<T>(
      {dynamic error, String? errorMessage}) {
    return InvokeResult<T>(false, error: error,errorMessage: errorMessage);
  }

  static InvokeResult<T> getSuccessResult<T>({T? data}) {
    return InvokeResult(true, data: data);
  }
}

class MessageError extends Error {
  String? message;

  MessageError({this.message});

  @override
  String toString() {
    return Error.safeToString(message);
  }
}
