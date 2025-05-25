import 'dart:collection';

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HiveStorage {
  static Box? _userBox;
  static Box? _globalBox;

  static HashMap<String, Box> _userBoxMap = HashMap<String, Box>();

  static const _globalUserIdKey = "last_login_user_id";

  static Future<void> init({String? subDir, String? globalBoxName}) async {
    await Hive.initFlutter(subDir);
    _globalBox = await Hive.openBox(globalBoxName ?? "HiveStorage_global_box");
    String? userId =
        getFromGlobal<String>(_globalUserIdKey, defaultValue: null);
    if (userId != null && userId.isNotEmpty) {
      await openUserBox(userId);
    }
  }

  static Future<Box?> openBox(String boxName) async {
    var box = await Hive.openBox(boxName);
    return box;
  }

  static Future<void>? put2specify(String boxName, dynamic key, dynamic value) {
    return getBox(boxName)?.put(key, value);
  }

  static T? getFromSpecify<T>(String boxName, dynamic key, {T? defaultValue}) {
    return getBox(boxName)?.get(key, defaultValue: defaultValue);
  }

  static Box? getBox(String boxName) {
    return _userBoxMap[boxName];
  }

  static Future<Box?> openUserBox(String userId) async {
    await saveUser2global(userId);
    _userBox = await Hive.openBox(userId);
    return _userBox;
  }

  static Future<void>? saveUser2global(String uid) {
    return _globalBox?.put(_globalUserIdKey, uid);
  }

  static Future<void>? put2user(dynamic key, dynamic value) {
    return _userBox?.put(key, value);
  }

  static Future<void>? put2global(dynamic key, dynamic value) {
    return _globalBox?.put(key, value);
  }

  static Future<void> userLogout() async {
    return _globalBox?.delete(_globalUserIdKey);
  }

  static T? getFromUser<T>(dynamic key, {T? defaultValue}) {
    try {
      return _userBox?.get(key, defaultValue: defaultValue);
    } catch (e) {
      return null;
    }
  }

  static T? getFromGlobal<T>(dynamic key, {T? defaultValue}) {
    try {
      return _globalBox?.get(key, defaultValue: defaultValue);
    } catch (e) {
      return null;
    }
  }

  static Future<void>? closeUserBox() {
    try {
      return _userBox?.close();
    } catch (e) {
      return null;
    }
  }

  static Future<int?> clearUserBox() async {
    try {
      return await _userBox?.clear();
    } catch (e) {
      return null;
    }
  }

  static Future<void>? closeAll() {
    try {
      return Hive.close();
    } catch (e) {
      return null;
    }
  }
}
