
import 'base_user_profile.dart';

abstract class UserListener<T extends BaseUserProfile>{

  void onUserLogin(T userProfile);

  void onUserLogOut();

}