// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localStorageProvider =
    Provider<LocalStorage>((ref) => throw UnimplementedError());

abstract class LocalStorage {
  Future<void> saveString(String key, String value);
  Future<String?> getString(String key);
  Future<void> removeValue(String key);

  Future<void> saveBool(String key, bool value);
  Future<bool?> getBool(String key);
}

class LocalStorageImpl extends LocalStorage {
  LocalStorageImpl(SharedPreferences prefs) : _prefs = prefs;

  late final SharedPreferences _prefs;

  @override
  Future<String?> getString(String key) async => _prefs.getString(key);

  @override
  Future<void> removeValue(String key) async => _prefs.remove(key);

  @override
  Future<void> saveString(String key, String value) async =>
      _prefs.setString(key, value);

  @override
  Future<bool?> getBool(String key) async => _prefs.getBool(key);

  @override
  Future<void> saveBool(String key, bool value) async =>
      _prefs.setBool(key, value);
}
