import 'dart:io';

enum HttpUnknownErrorType {
  dioError,
  nullResponse;
}

class HttpError extends HttpException {
  final int? statusCode;
  final String? statusMessage;

  HttpError(this.statusCode, this.statusMessage, Uri uri)
      : super(
            statusMessage ??
                "HttpError Happened!!! statusCode = $statusCode ,statusMessage = $statusMessage",
            uri: uri);
}

class HttpUnknownError extends IOException {
  final HttpUnknownErrorType errorType;
  dynamic error;

  HttpUnknownError(this.errorType, {this.error});

  @override
  String toString() {
    return "錯誤類型：${errorType.name}，詳細信息：$error";
  }
}

class ApiError implements IOException {
  final int? serverCode;
  final String? serverMessage;

  ApiError(this.serverCode, this.serverMessage);

  @override
  String toString() {
    return "$serverMessage($serverCode)";
  }
}

class TextInApiError implements IOException {
  final int code;
  final String? message;

  TextInApiError(this.code, this.message);

  @override
  String toString() {
    return "$runtimeType Happened，serverCode = $code，serverMessage = $message";
  }
}
