import 'package:jpush_google_flutter/jpush_google_flutter.dart';
import 'package:mh_base/common/push/push_listener.dart';
import 'package:mh_base/common/user/user_listener.dart';

import '../../log/mh_logger.dart';
import '../user/base_user_profile.dart';

class BasePushManager<T extends BaseUserProfile> extends UserListener<T> {
  final JPush _jPush = JPush();
  bool hasSetup = false;
  final List<OnReceiveNotificationListener> _onReceiveNotificationListeners = [];
  final List<OnOpenNotificationListener> _onOpenNotificationListeners = [];

  Future<void> setUp({
    String appKey = '',
    bool production = false,
    String channel = '',
    bool debug = false,
  }) async {
    if (hasSetup) {
      return;
    }
    try {
      _jPush.setAuth(enable: true);
      _jPush.setup(
          appKey: appKey,
          production: production,
          channel: channel,
          debug: debug);
      _jPush.applyPushAuthority(NotificationSettingsIOS());
      _jPush.addEventHandler(onReceiveNotification: (a) async {
        for (var e in _onReceiveNotificationListeners) {
          e.onReceiveNotification(a);
        }
      }, onOpenNotification: (a) async {
        for (var e in _onOpenNotificationListeners) {
          e.onOpenNotification(a);
        }
      });
    }catch(e){

    }
    hasSetup = true;
  }

  void addNotificationReceiveListener(OnReceiveNotificationListener listener) {
    _onReceiveNotificationListeners.add(listener);
  }

  void removeNotificationReceiveListener(
      OnReceiveNotificationListener listener) {
    _onReceiveNotificationListeners.remove(listener);
  }

  void addNotificationOpenListener(OnOpenNotificationListener listener) {
    _onOpenNotificationListeners.add(listener);
  }

  void removeNotificationOpenListener(OnOpenNotificationListener listener) {
    _onOpenNotificationListeners.remove(listener);
  }

  Future<String?> getRegistrationId() async {
    try {
    var res = await _jPush.getRegistrationID();
    "jpush registration id = $res".logD();
    return res;
    } catch (e) {
      return null;
    }
  }

  Future<Map<dynamic, dynamic>> setAlias(String alias) async {
    if(!hasSetup){
      return {};
    }
    try {
      var res = await _jPush.setAlias(alias);
      return res;
    } catch (e) {
      return {"errorCode": -1};
    }
  }

  Future<Map<dynamic, dynamic>> deleteAlias() async {
    if(!hasSetup){
      return {};
    }
    try {
      var res = await _jPush.deleteAlias();
      return res;
    } catch (e) {
      return {"errorCode": -1};
    }
  }

  Future<dynamic> stopPush() async {
    try {
      var res = await _jPush.stopPush();
      return res;
    }catch (e) {
      return null;
    }
  }

  Future<dynamic> resumePush() async {
    try {
      return _jPush.resumePush();
    }catch (e) {
      return null;
    }
  }

  @override
  void onUserLogOut() {
    deleteAlias();
  }

  @override
  void onUserLogin(T userProfile) async  {
    await deleteAlias();
    await setAlias(userProfile.getUserId());
  }
}
