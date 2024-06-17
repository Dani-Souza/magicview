import 'dart:io';

abstract class FavoriteRepository {
  Future<Map<String, dynamic>> login(
      {required String url,
      required String endPoint,
      Map<String, String> headers = const {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      required Map<String, String> body});

  Future<Map<String, dynamic>> addUser(
      {required String url,
      required String endPoint,
      Map<String, String> headers = const {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      required Map<String, String> body});

  Future<String> upload({
    required String url,
    required String endPoint,
    required Map<String, String> headers,
    required File fileName,
  });

  Future<String> post({
    required String url,
    required String endPoint,
    required Map<String, String> headers,
  });

  Future<Map<String, dynamic>> getUser(
      {required String url,
      required String endPoint,
      Map<String, String> queryParament = const {},
      required Map<String, String> headers,
      required Map<String, String> body});

  Future<List<dynamic>> getList(
      {required String url,
      required String endPoint,
      Map<String, String> queryParament = const {},
      required Map<String, String> headers,
      required Map<String, String> body});
}
