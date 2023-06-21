import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import './storage.dart';

final class LocalStorageImpl implements Storage {
  late final SharedPreferences? sharedPreferences;

  LocalStorageImpl() {
    _init();
  }

  void _init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  String? get(String key) => sharedPreferences?.getString(key);

  @override
  void remove(String key) => sharedPreferences?.remove(key);

  @override
  void clean() => sharedPreferences?.clear();

  @override
  void put<T>(String key, T value) {
    switch (value.runtimeType) {
      case String:
        sharedPreferences?.setString(key, value as String);
        break;
      case int:
        sharedPreferences?.setInt(key, value as int);
        break;
      case bool:
        sharedPreferences?.setBool(key, value as bool);
        break;
      case double:
        sharedPreferences?.setDouble(key, value as double);
        break;
      case Map:
        sharedPreferences?.setString(key, jsonEncode(value as Map));
        break;
    }
  }
}
