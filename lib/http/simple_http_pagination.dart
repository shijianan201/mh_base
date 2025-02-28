import 'package:dio/dio.dart';

import '../common/simple_list_page_state.dart';
import 'http_result.dart';
import 'model/page_response.dart';

class SimpleHttpPagination<T> {
  bool firstRefresh = true;
  int pageNo = 1;
  int pageSize = 10;
  List<T> dataList = [];
  List<CancelToken> cancelTokens = [];
  int totalCount = 0;
  Future<HttpResult<List<T>>> Function(int pageNo, int pageSize,
      CancelToken? cancelToken, Map<String, dynamic>? params) onLoadData;

  SimpleHttpPagination(
      {this.pageSize = 10,
      this.pageNo = 1,
        required this.dataList,
      required this.onLoadData});

  Future<RefreshResult> refresh(
      {Map<String, dynamic>? params, CancelToken? cancelToken}) async {
    if(cancelToken != null){
      cancelTokens.add(cancelToken);
    }
    bool previousIsEmpty = dataList.isEmpty;
    var tempPageNo = 1;
    var res = await onLoadData(tempPageNo, pageSize, cancelToken, params);
    if (res.isSuccess()) {
      dataList.clear();
      var temp = res.response;
      if (temp != null) {
        dataList.addAll(temp);
      }
      pageNo = 1;
    }
    totalCount = res.response?.length ?? 0;
    firstRefresh = false;
    return RefreshResult(
        refresh: true,
        isEmpty: dataList.isEmpty,
        previousIsEmpty: previousIsEmpty,
        isFirstPage: firstRefresh,
        hasMoreData: false,
        error: res.error,
        itemCount: dataList.length);
  }

  // Future<RefreshResult> loadMore(
  //     {Map<String, dynamic>? params, CancelToken? cancelToken}) async {
  //   if(cancelToken != null){
  //     cancelTokens.add(cancelToken);
  //   }
  //   bool previousIsEmpty = dataList.isEmpty;
  //   var tempPageNo = pageNo + 1;
  //   var res = await onLoadData(tempPageNo, pageSize, cancelToken, params);
  //   if (res.isSuccess()) {
  //     totalCount = res.response?.total ?? 0;
  //     var temp = res.response?.dataList;
  //     if (temp != null) {
  //       dataList.addAll(temp);
  //     }
  //     pageNo = tempPageNo;
  //   }
  //   return RefreshResult(
  //       refresh: false,
  //       isEmpty: dataList.isEmpty,
  //       previousIsEmpty: previousIsEmpty,
  //       isFirstPage: firstRefresh,
  //       hasMoreData: res.response?.hasNext ?? true,
  //       error: res.error,
  //       itemCount: dataList.length);
  // }

  void addData(T data){
    dataList.add(data);
  }


  bool isEmpty(){
    return dataList.isEmpty;
  }

  void removeList(List<T> removeList){
    for (var e in removeList) {
      dataList.remove(e);
    }
  }

  void dispose() {
    //cancel请求啥的可以放在这
    for (var a in cancelTokens) {
      a.cancel();
    }
  }
}
