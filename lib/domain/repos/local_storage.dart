abstract class LocalStorage {
  Future<void> saveString(String value, String key);
  Future<String?> getString(String key);
}
