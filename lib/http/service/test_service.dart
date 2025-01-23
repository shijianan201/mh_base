import 'package:dio/dio.dart';
import 'package:landlord_mtech/base/console_logger.dart';
import 'package:landlord_mtech/base/http/model/github_user_info_entity.dart';

import 'http_service.dart';

class TestService extends HttpService {
  TestService({required super.dio});

  void test() {
    request("/users/shijianan201", options: Options(method: "GET"))
        .then((value) {
      GithubUserInfoEntity githubUserInfoEntity =
          GithubUserInfoEntity.fromJson(value);
      Log.d("haha ${githubUserInfoEntity.name}");
    }).onError((error, stackTrace) {
      Log.e("${error.toString()} $stackTrace");
    }).whenComplete(() {
      Log.d("請求結束");
    });
  }

  void userLogin() {

  }
}
