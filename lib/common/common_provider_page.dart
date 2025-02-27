import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mh_base/common/common_page.dart';
import 'package:mh_base/common/event/common_event.dart';
import 'package:mh_base/common/event/event_bus.dart';
import 'package:mh_base/common/util/run_util.dart';
import 'package:mh_base/page/extra/base_route_extra.dart';
import 'package:provider/provider.dart';

import '../http/api_request_host.dart';

class SimpleChangeNotifier extends ChangeNotifier
    with ApiRequestHost, EventOwner {
  SimpleChangeNotifier() {
    if (enableEventBus()) {
      listenEvent<CommonEvent>();
    }
  }

  void runDelayed(Function runnable,
      {Duration duration = Duration.zero}) async {
    await Future.delayed(duration);
    await RunUtil.runAtNextFrameCome((d) async {
      runnable.call();
    });
  }

  @override
  void dispose() {
    if (enableEventBus()) {
      releaseAllEvents();
    }
    super.dispose();
  }

  @override
  void onReceiveCommonEvent(CommonEvent event) {}

  @override
  void onReceiveEvent(event) {}

}

class CommonChangeNotifier extends SimpleChangeNotifier {
  final BuildContext context;

  CommonChangeNotifier({required this.context});
}

///基础页面通知者
class CommonPageNotifier<T extends BaseRouteExtra>
    extends CommonChangeNotifier {
  final GoRouterState state;

  CommonPageNotifier({required this.state, required super.context});

  @override
  void dispose() {
    super.dispose();
    releaseAllRequests();
  }

  T getRouteExtra() {
    var ex = this.state.extra;
    if (ex is T) {
      return ex;
    } else {
      throw Exception("getRouteExtra failed: ${ex.runtimeType},$ex");
    }
  }
}

abstract class SimpleProviderPage<T extends CommonChangeNotifier>
    extends CommonPage {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (
      BuildContext context,
      T controller,
      Widget? child,
    ) {
      return super.build(context);
    });
  }

  @override
  Widget buildBody(BuildContext context) {
    return getPageConsumer();
  }

  Consumer<T> getPageConsumer() {
    return Consumer(builder: (
      BuildContext context,
      T controller,
      Widget? child,
    ) {
      return buildProviderBody(context, controller, child);
    });
  }

  Widget buildProviderBody(BuildContext context, T controller, Widget? child);

  T getPageNotifier(BuildContext context) {
    return Provider.of(context, listen: false);
  }
}

abstract class CommonProviderPage<E extends BaseRouteExtra,
    T extends CommonPageNotifier<E>> extends SimpleProviderPage<T> {}

///通用使用provider更新数据的使用CommonRouteExtra传递参数的页面基类
abstract class CommonProviderExtraPage<
        T extends CommonPageNotifier<CommonRouteExtra>>
    extends CommonProviderPage<CommonRouteExtra, T> {}
