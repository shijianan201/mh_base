import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'dart:convert';

import 'name_util.dart';

class EncryptUtil {
  // 密匙
  static const String SECRET_KEY = 'WJiol_8776#';

  static String md5Encrypt(String password) {
    final str = 'password=$password&key=$SECRET_KEY';
    var bytes = utf8.encode(str);
    var digest = md5.convert(bytes);
    return digest.toString();
  }

  static String randomText(int length) {
    Random random = Random();
    String chars =
        "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890";
    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join();
  }

  static String randomTwName() {
    Random random = Random();
    String firstName = firstNames[random.nextInt(firstNames.length)];
    String lastName = lastNames[random.nextInt(lastNames.length)];
    return "$firstName$lastName";
  }

  static String randomDigitalNumber(int count) {
    Random random = Random();
    String res = "";
    for (var i = 0; i < count; i++) {
      res += "${random.nextInt(10)}";
    }
    return res;
  }
}
