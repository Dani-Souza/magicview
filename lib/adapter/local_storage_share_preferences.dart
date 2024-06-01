abstract class LocalStorageSharedPreferences {
  Future<void> set(String key, Map<String, dynamic> value);
  Future<Map<String, dynamic>> get(String key);
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> addCountFavorite(String key, int count);
  Future<int?> getCountFavorite(String key);
}
