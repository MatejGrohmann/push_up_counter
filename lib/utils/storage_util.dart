import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract mixin class StorageUtil {
  Future<SharedPreferences> get _sharedPrefs => SharedPreferences.getInstance();

  Future<void> storeData({
    required String key,
    required Map<String, dynamic>? data,
  }) {
    if (data == null) {
      return removeData(key: key);
    }
    return _sharedPrefs.then((sharedPrefs) {
      sharedPrefs.setString(key, jsonEncode(data));
    });
  }

  Future<Map<String, dynamic>?> fetchData({required String key}) {
    return _sharedPrefs.then((sharedPrefs) {
      final data = sharedPrefs.getString(key);
      if (data != null) {
        return jsonDecode(data) as Map<String, dynamic>;
      }
      return null;
    });
  }

  Future<void> removeData({required String key}) {
    return _sharedPrefs.then((sharedPrefs) {
      sharedPrefs.remove(key);
    });
  }

  Future<void> clearData() {
    return _sharedPrefs.then((sharedPrefs) {
      sharedPrefs.clear();
    });
  }

  Map<String, dynamic>? convertData({required data});

  retrieveData({required Map<String, dynamic>? jsonData});
}
