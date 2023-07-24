import 'package:shared_preferences/shared_preferences.dart';
import 'package:teammate/domain/repos/local_storage.dart';

class LocalStorageImpl implements LocalStorage {
  LocalStorageImpl();
  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  late SharedPreferences _prefs;

  @override
  Future<String?> getString(String key) async => _prefs.getString(key);

  @override
  Future<void> saveString(String value, String key) =>
      _prefs.setString(key, value);
}
