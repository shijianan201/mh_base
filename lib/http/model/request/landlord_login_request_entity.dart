import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/landlord_login_request_entity.g.dart';
import 'dart:convert';

import '../../../../common/account/login_page.dart';
import '../../../../common/account/thirdlogin/third_login.dart';


@JsonSerializable()
class LandlordLoginRequestEntity {
  String phoneNumber = '';
  String password = '';
  String extra = '';
  int loginType = LoginType.phoneNumber.code;
  @JSONField(deserialize: false, serialize: false)
  ThirdLoginInfo? thirdLoginInfo;
  @JSONField(deserialize: false, serialize: false)
  bool enableNotification = false;
  String loginId = '';


  LandlordLoginRequestEntity();

  factory LandlordLoginRequestEntity.fromJson(Map<String, dynamic> json) =>
      $LandlordLoginRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => $LandlordLoginRequestEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
