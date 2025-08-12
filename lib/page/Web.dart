import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mh_base/common/common_page.dart';
import 'package:mh_base/common/common_provider_page.dart';
import 'package:mh_base/common/util/text_util.dart';
import 'package:mh_base/log/mh_logger.dart';
import 'package:mh_base/page/extra/base_route_extra.dart';
import 'package:mh_base/widget/app_bar_action.dart';
import 'package:mh_base/widget/mh_inkwell.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebRouteExtra extends CommonRouteExtra {
  final String? title;
  String? url;
  bool titleChangeByH5 = false;
  bool backCloseMode = false;
  List<AppBarAction> actions;
  Map<String, dynamic> cookies = <String, dynamic>{}; //自定义请求头>

  WebRouteExtra(
      {required this.title,
      this.url,
      this.titleChangeByH5 = false,
      this.backCloseMode = false,
      this.cookies = const {},
      this.actions = const []});
}

class WebPageNotifier extends CommonPageNotifier<WebRouteExtra> {
  final WebViewController _controller = WebViewController();
  int loadingProgress = 0;
  bool loadFailed = false;
  final cookieManager = WebViewCookieManager();
  Future<void>? initFuture;

  WebPageNotifier({required super.context, required super.state}) {
    _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    _controller.setNavigationDelegate(NavigationDelegate(onProgress: (a) {
      loadingProgress = a;
      notifyListeners();
    }, onPageStarted: (a) {
      loadingProgress = 0;
      notifyListeners();
    }, onPageFinished: (a) {
      loadingProgress = 100;
      notifyListeners();
    }, onNavigationRequest: (a) {
      return NavigationDecision.navigate;
    }));
    initFuture = loadUrl();
  }

  Future<void> setCookie(String domain) async {
    var cookies = getRouteExtra().cookies;
    cookies.forEach((key, value) async {
      await cookieManager
          .setCookie(WebViewCookie(name: key, value: value, domain: domain));
    });
  }

  Future<void> loadUrl() async {
    var url = getRouteExtra().url;
    if (url.isNullOrEmpty()) {
      loadFailed = true;
      notifyListeners();
      return;
    }
    try {
      var uri = Uri.parse(url!);
      await setCookie(uri.host);
      await _controller.loadRequest(uri);
      loadFailed = false;
      notifyListeners();
    } catch (e) {
      logE("加載url失敗,url = $url", error: e);
      loadFailed = true;
      notifyListeners();
    }
  }
}

class WebPage extends CommonProviderExtraPage<WebPageNotifier> {
  static final String pageName = "/common/Web";

  static final route = GoRoute(
      path: pageName,
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (ctx) => WebPageNotifier(context: context, state: state),
          child: WebPage(),
        );
      });

  static void start(BuildContext context, WebRouteExtra extra) {
    GoRouter.of(context).push(pageName, extra: extra);
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    var actions = getPageNotifier(context).getRouteExtra().actions;
    var title = getPageNotifier(context).getRouteExtra().title;
    var backCloseMode = getPageNotifier(context).getRouteExtra().backCloseMode;
    List<Widget> actionsList = [];
    for (var ac in actions) {
      actionsList.add(Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: AppBarActionView(action: ac),
      ));
    }
    actionsList.add(SizedBox(
      width: 12,
    ));
    if (title.isNullOrEmpty()) {
      return null;
    } else {
      return getBackAppBar(context,
          title: title,
          backIcon: backCloseMode ? Icons.close : Icons.arrow_back_ios,
          actions: actionsList);
    }
  }

  @override
  Widget buildProviderBody(
      BuildContext context, WebPageNotifier controller, Widget? child) {
    return FutureBuilder(future: controller.initFuture, builder: (a,b){
      if(b.connectionState != ConnectionState.done){
        return LinearProgressIndicator(
          minHeight: 4,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation(Colors.red),
          value: controller.loadingProgress.toDouble() / 100,
        );
      }else{
        return controller.loadFailed
            ? MhInkWell(
          onTap: () {
            controller.loadUrl();
          },
          child: Column(
            children: [Text("頁面加載失敗，點擊空白處重識")],
          ),
        )
            : WebViewWidget(controller: controller._controller);
      }
    });
  }
}
