import 'package:dio/dio.dart';
import 'package:magicview/pages/home_pages/favorite_resposioty.dart';

class FavoriteRespositoryImple extends FavoriteRepository {
  final Dio dio;

  FavoriteRespositoryImple({required this.dio});

  @override
  Future<String> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
