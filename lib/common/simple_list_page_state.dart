import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'event/common_event.dart';
import 'event/event_bus.dart';

class RefreshResult {
  final bool refresh;
  final bool isEmpty;
  final bool previousIsEmpty;
  final bool isFirstPage;
  final bool hasMoreData;
  dynamic error;
  final int itemCount;

  RefreshResult({
    this.refresh = true,
    this.isEmpty = false,
    this.previousIsEmpty = true,
    this.isFirstPage = true,
    this.hasMoreData = true,
    this.error,
    this.itemCount = 0,
  });
}

typedef OnListRequestCallback = Function(RefreshResult);

enum ListRefreshStatus {
  idle,
  refreshing,
  loading,
}

enum ListPageStatus { firstRefreshing, firstRefreshFailed, content, empty }

abstract class SimpleListPageState<T extends StatefulWidget> extends State<T>
    with EventOwner {
  late RefreshController _refreshController;
  ListPageStatus listPageStatus = ListPageStatus.firstRefreshing;
  ListRefreshStatus refreshStatus = ListRefreshStatus.idle;
  bool showSkeleton = true;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: false);
    showSkeleton = enableSkeleton();
    var initialRefresh = enableInitialRefresh();
    if (initialRefresh) {
      refreshStatus = ListRefreshStatus.refreshing;
    }
    WidgetsBinding.instance.addPostFrameCallback((a){
      onRefresh();
    });
    if(enableEventBus()){
      listenEvent<CommonEvent>();
    }
  }

  @override
  void onReceiveCommonEvent(CommonEvent event) {}

  @override
  void onReceiveEvent(event) {}

  @override
  void dispose() {
    releaseAllEvents();
    _refreshController.dispose();
    super.dispose();
  }

  void startRefresh() {
    if (!mounted) {
      return;
    }
    if (refreshStatus != ListRefreshStatus.idle) {
      return;
    }
    refreshStatus = ListRefreshStatus.refreshing;
    _refreshController.requestRefresh();
    onRefresh();
  }

  void endRefreshByResult(RefreshResult result) {
    endRefresh(
      refresh: result.refresh,
      dataIsEmpty: result.isEmpty,
      previousDataIsEmpty: result.previousIsEmpty,
      error: result.error,
      hasMoreData: result.hasMoreData,
      itemCount: result.itemCount,
    );
  }

  void endRefresh({
    bool refresh = true,
    bool dataIsEmpty = true,
    bool previousDataIsEmpty = true,
    bool hasMoreData = true,
    dynamic error,
    int itemCount = 0,
  }) {
    refreshStatus = ListRefreshStatus.idle;
    if (!mounted) {
      return;
    }
    if (refresh) {
      if (error != null) {
        _refreshController.refreshCompleted();
        if (previousDataIsEmpty) {
          _refreshController.refreshFailed();
          _refreshController.resetNoData();
          listPageStatus = ListPageStatus.firstRefreshFailed;
        } else {
          _refreshController.resetNoData();
          listPageStatus = ListPageStatus.content;
        }
      } else {
        _refreshController.refreshCompleted();
        if (dataIsEmpty) {
          listPageStatus = ListPageStatus.empty;
          _refreshController.resetNoData();
        } else {
          listPageStatus = ListPageStatus.content;
          if (!hasMoreData) {
            _refreshController.loadNoData();
          } else {
            _refreshController.resetNoData();
          }
        }
      }
    } else {
      if (error != null) {
        if (previousDataIsEmpty) {
          _refreshController.loadFailed();
          listPageStatus = ListPageStatus.firstRefreshFailed;
        } else {
          _refreshController.loadComplete();
          listPageStatus = ListPageStatus.content;
        }
      } else {
        if (dataIsEmpty) {
          if (previousDataIsEmpty) {
            _refreshController.loadComplete();
            listPageStatus = ListPageStatus.empty;
          } else {
            _refreshController.loadComplete();
            listPageStatus = ListPageStatus.content;
          }
        } else {
          _refreshController.loadComplete();
          listPageStatus = ListPageStatus.content;
        }
        if (!hasMoreData) {
          _refreshController.loadNoData();
        } else {
          _refreshController.resetNoData();
        }
      }
    }
    if (refresh && showSkeleton) {
      hideSkeleton();
    }
    setState(() {});
  }

  void _doRefreshLogic() {
    if (!mounted) {
      return;
    }
    if (refreshStatus != ListRefreshStatus.idle) {
      if (refreshStatus == ListRefreshStatus.loading) {
        _refreshController.refreshCompleted();
      }

      return;
    }
    refreshStatus = ListRefreshStatus.refreshing;
    onRefresh();
  }

  void _doLoadMoreLogic() {
    if (!mounted) {
      return;
    }
    if (refreshStatus != ListRefreshStatus.idle) {
      if (refreshStatus == ListRefreshStatus.refreshing) {
        _refreshController.loadComplete();
      }

      return;
    }
    refreshStatus = ListRefreshStatus.loading;
    onLoadMore();
  }

  void onRefresh();

  void onLoadMore();

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (listPageStatus == ListPageStatus.firstRefreshing) {
      content = buildFirstRefreshContent();
    } else if (listPageStatus == ListPageStatus.firstRefreshFailed) {
      content = buildFirstRefreshFailedContent();
    } else if (listPageStatus == ListPageStatus.empty) {
      content = buildEmptyContent();
    } else {
      content = buildRefreshContent();
    }
    return SmartRefresher(
      header: ClassicHeader(
        textStyle: TextStyle(
          color: const Color(0xff6e747a),
          fontSize: 14,
        ),
        refreshingIcon: SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            color: const Color.fromARGB(255, 111, 122, 110),
            strokeWidth: 2,
          ),
        ),
        idleText: "拖動以刷新...",
        refreshingText: "正在刷新中...",
        failedText: "刷新數據失敗",
        releaseText: "鬆開即可刷新",
        completeText: "刷新成功",
        failedIcon: const Icon(Icons.error, color: Color(0xff6e747a)),
        completeIcon: const Icon(Icons.done, color: Color(0xff6e747a)),
        idleIcon: const Icon(Icons.arrow_downward, color: Color(0xff6e747a)),
        releaseIcon: const Icon(Icons.refresh, color: Color(0xff6e747a)),
      ),
      footer: getFooter(),
      controller: _refreshController,
      onRefresh: _doRefreshLogic,
      onLoading: _doLoadMoreLogic,
      enablePullDown:
      enableRefresh() && refreshStatus == ListRefreshStatus.idle,
      enablePullUp: enableLoadMore() &&
          refreshStatus == ListRefreshStatus.idle &&
          listPageStatus == ListPageStatus.content,
      child: content,
    );
  }

  Widget getFooter() {
    return ClassicFooter(
      failedText: "加載失敗，請重試",
      idleText: "上拉加載數據",
      loadingText: "數據加載中，請稍候...",
    );
  }

  void showEmpty() {
    if (!mounted) {
      return;
    }
    setState(() {
      listPageStatus = ListPageStatus.empty;
    });
  }

  void showContent() {
    if (!mounted) {
      return;
    }
    setState(() {
      listPageStatus = ListPageStatus.content;
    });
  }

  //可滑动的View此时需要放在第一层
  Widget buildRefreshContent();

  Widget buildFirstRefreshContent() {
    return showSkeleton
        ? ListView.builder(
            itemCount: 100,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, pos) {
              return buildSkeletonItem(ctx, pos);
            },
          )
        : const Center(child: CircularProgressIndicator());
  }

  Widget buildFirstRefreshFailedContent() {
    return SizedBox();
  }

  Widget buildEmptyContent() {
    return SizedBox();
  }

  bool enableInitialRefresh() {
    return true;
  }

  bool enableInitialRefreshAnimation() {
    return false;
  }

  bool enableRefresh() {
    return true;
  }

  bool enableLoadMore() {
    return true;
  }

  bool enableSkeleton() {
    return true;
  }

  Widget buildSkeletonItem(BuildContext context, int pos) {
    return SizedBox();
  }

  void hideSkeleton() {
    if (!mounted) {
      return;
    }
    setState(() {
      showSkeleton = false;
    });
  }

  bool enableNoMoreData() {
    return true;
  }
}
