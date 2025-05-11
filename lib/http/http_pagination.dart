import 'package:dio/dio.dart';

import '../common/simple_list_page_state.dart';
import 'http_result.dart';
import 'model/page_response.dart';

class HttpPagination<T> {
  bool firstRefresh = true;
  int pageNo = 1;
  int pageSize = 10;
  List<T> dataList = [];
  List<CancelToken> cancelTokens = [];
  int totalCount = 0;
  Future<HttpResult<PageResponse<T>>> Function(int pageNo, int pageSize,
      CancelToken? cancelToken, Map<String, dynamic>? params) onLoadData;

  HttpPagination(
      {this.pageSize = 10, this.pageNo = 1, required this.onLoadData});

  Future<RefreshResult> refresh(
      {Map<String, dynamic>? params, CancelToken? cancelToken}) async {
    if (cancelToken != null) {
      cancelTokens.add(cancelToken);
    }
    bool previousIsEmpty = dataList.isEmpty;
    var tempPageNo = 1;
    var res = await onLoadData(tempPageNo, pageSize, cancelToken, params);
    if (res.isSuccess()) {
      dataList.clear();
      var temp = res.response?.dataList;
      if (temp != null) {
        dataList.addAll(temp);
      }
      pageNo = 1;
    }
    totalCount = res.response?.paginationResponse?.total ?? 0;
    firstRefresh = false;
    var hasNext = false;
    if (res.getData().paginationResponse == null) {
      hasNext = false;
    } else {
      hasNext = res.response?.paginationResponse?.page != null &&
          res.response?.paginationResponse?.page ==
              res.response?.paginationResponse?.totalPages;
    }
    return RefreshResult(
        refresh: true,
        isEmpty: dataList.isEmpty,
        previousIsEmpty: previousIsEmpty,
        isFirstPage: firstRefresh,
        hasMoreData: hasNext,
        error: res.error,
        itemCount: dataList.length);
  }

  Future<RefreshResult> loadMore(
      {Map<String, dynamic>? params, CancelToken? cancelToken}) async {
    if (cancelToken != null) {
      cancelTokens.add(cancelToken);
    }
    bool previousIsEmpty = dataList.isEmpty;
    var tempPageNo = pageNo + 1;
    var res = await onLoadData(tempPageNo, pageSize, cancelToken, params);
    if (res.isSuccess()) {
      totalCount = res.response?.paginationResponse?.total ?? 0;
      var temp = res.response?.dataList;
      if (temp != null) {
        dataList.addAll(temp);
      }
      pageNo = tempPageNo;
    }
    var hasNext = false;
    if (res.getData().paginationResponse == null) {
      hasNext = false;
    } else {
      hasNext = res.response?.paginationResponse?.page != null &&
          res.response?.paginationResponse?.page ==
              res.response?.paginationResponse?.totalPages;
    }
    return RefreshResult(
        refresh: false,
        isEmpty: dataList.isEmpty,
        previousIsEmpty: previousIsEmpty,
        isFirstPage: firstRefresh,
        hasMoreData: hasNext,
        error: res.error,
        itemCount: dataList.length);
  }

  void dispose() {
    //cancel请求啥的可以放在这
    for (var a in cancelTokens) {
      a.cancel();
    }
  }
}
