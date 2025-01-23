import 'package:async/async.dart';

abstract class ApiRequestHost {
  final List<CancelableOperation> apiRequests = [];

  Future<T> registerRequest<T>(Future<T> requestFuture) {
    CancelableOperation operation =
        CancelableOperation.fromFuture(requestFuture);
    apiRequests.add(operation);
    return requestFuture;
  }

  void releaseAllRequests() {
    for (var element in apiRequests) {
      element.cancel();
    }
    apiRequests.clear();
  }
}
