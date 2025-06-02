import 'package:mh_base/common/user/user_listener.dart';

import 'base_user_profile.dart';

mixin class BaseUserManager<T extends BaseUserProfile> {
  final List<UserListener<T>> _userListeners = [];

  void addUserListener(UserListener<T> listener) {
    _userListeners.add(listener);
  }

  void removeUserListener(UserListener<T> listener) {
    _userListeners.remove(listener);
  }

  void notifyUserLogin(T profile){
    for (var e in _userListeners) {
      e.onUserLogin(profile);
    }
  }

  void notifyUserLogout(){
    for (var e in _userListeners) {
      e.onUserLogOut();
    }
  }
}
