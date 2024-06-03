import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:magicview/reposistories/remote/http_exception.dart';
import 'package:http_parser/http_parser.dart';

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

  Future<Map<String, dynamic>> get(
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

class FavoriteRespositoryImpl implements FavoriteRepository {
  @override
  Future<Map<String, dynamic>> login(
      {required String url,
      required String endPoint,
      Map<String, String> headers = const {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      required Map<String, String> body}) async {
    final response = await http.post(Uri.http(url, endPoint),
        headers: headers, body: json.encode(body));

    if (response.statusCode == 400) {
      throw HttpException(json.decode(response.body)["message"]);
    }

    if (response.statusCode == 403) {
      throw HttpException(json.decode(response.body)["message"]);
    }

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw (response.reasonPhrase.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> addUser(
      {required String url,
      required String endPoint,
      Map<String, String> headers = const {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
      required Map<String, String> body}) async {
    final response = await http.post(Uri.http(url, endPoint),
        headers: headers, body: json.encode(body));

    if (response.statusCode == 400) {
      throw HttpException(response.body);
    }

    if (response.statusCode == 403) {
      throw HttpException(response.body);
    }

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw (response.reasonPhrase.toString());
    }
  }

  @override
  Future<String> upload(
      {required String url,
      required String endPoint,
      required Map<String, String> headers,
      required File fileName}) async {
    var uri = Uri.http(url, endPoint);
    var request = http.MultipartRequest(
      'POST',
      uri,
    );
    request.headers.addAll(headers);

    request.files.add(
      await http.MultipartFile.fromPath('file', fileName.path,
          contentType: MediaType('image', 'png')),
    );
    var res = await request.send();
    http.Response response = await http.Response.fromStream(res);
    print(response);

    if (response.statusCode == 403) {
      throw HttpException("Efetuar Login");
    }

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw HttpException("Falha Cadastro");
    }
  }

  @override
  Future<String> post(
      {required String url,
      required String endPoint,
      required Map<String, String> headers}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> get(
      {required String url,
      required String endPoint,
      Map<String, String> queryParament = const {},
      required Map<String, String> headers,
      Map<String, String> body = const {}}) async {
    final response = await http.get(Uri.http(url, endPoint, queryParament),
        headers: headers);

    if (response.statusCode == 403) {
      throw HttpException("Falha Autenticação");
    }

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw ("Falha resultado");
    }
  }

  @override
  Future<List> getList(
      {required String url,
      required String endPoint,
      Map<String, String> queryParament = const {},
      required Map<String, String> headers,
      Map<String, String> body = const {}}) async {
    final response = await http.get(Uri.http(url, endPoint, queryParament),
        headers: headers);

    if (response.statusCode == 403) {
      throw HttpException("Falha Autenticação");
    }

    if (response.statusCode == 200) {
      List<dynamic> decode = jsonDecode(response.body);
      return decode;
    } else {
      throw ("Falha resultado");
    }
  }
}
