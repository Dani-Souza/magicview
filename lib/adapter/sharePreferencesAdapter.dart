import 'dart:convert';

import 'package:magicview/adapter/local_storage_share_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePrefrencesAdapter extends LocalStorageSharedPreferences {
  @override
  Future<Map<String, dynamic>> get(String key) async {
    final instance = await SharedPreferences.getInstance();
    final response = instance.getString(key);
    return response != null ? jsonDecode(response) : null;
  }

  @override
  Future<void> set(String key, Map<String, dynamic> value) async {
    final instance = await SharedPreferences.getInstance();
    final result = await instance.setString(key, jsonEncode(value));
    print(result);
  }

  @override
  Future<String?> getToken() async {
    final instance = await SharedPreferences.getInstance();
    final tokenMap = instance.getString('token');
    return tokenMap;
  }

  @override
  Future<void> saveToken(String token) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString('token', token);
  }

  @override
  Future<void> addCountFavorite(String key, int count) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setInt(key, count);
  }

  @override
  Future<int> getCountFavorite(String key) async {
    final instance = await SharedPreferences.getInstance();
    final countFavorite = instance.getInt(key);
    return countFavorite ?? 0;
  }
}
