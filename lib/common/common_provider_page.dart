import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mh_base/common/common_page.dart';
import 'package:mh_base/page/extra/base_route_extra.dart';
import 'package:provider/provider.dart';

class CommonChangeNotifier extends ChangeNotifier {}

///基础页面通知者
class CommonPageNotifier<T extends BaseRouteExtra>
    extends CommonChangeNotifier {
  final BuildContext context;
  final GoRouterState state;

  CommonPageNotifier({required this.context, required this.state});
}

abstract class CommonProviderPage<E extends BaseRouteExtra,
    T extends CommonPageNotifier<E>> extends CommonPage {
  @override
  Widget buildBody(BuildContext context) {
    return getPageConsumer();
  }

  Consumer<T> getPageConsumer() {
    return Consumer(builder: (
      BuildContext context,
      T value,
      Widget? child,
    ) {
      return buildProviderBody(context, value, child);
    });
  }

  Widget buildProviderBody(BuildContext context, T value, Widget? child);

  T getPageNotifier(BuildContext context) {
    return Provider.of(context, listen: false);
  }
}

///通用使用provider更新数据的使用CommonRouteExtra传递参数的页面基类
abstract class CommonProviderExtraPage<
        T extends CommonPageNotifier<CommonRouteExtra>>
    extends CommonProviderPage<CommonRouteExtra, T> {}
