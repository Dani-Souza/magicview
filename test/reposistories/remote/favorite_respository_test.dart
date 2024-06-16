import 'package:flutter_test/flutter_test.dart';
import 'package:magicview/adapter/sharePreferencesAdapter.dart';
import 'package:magicview/bloc/get_users/get_user_bloc.dart';
import 'package:magicview/reposistories/remote/favorite_repositoy_impl.dart';
import 'package:magicview/reposistories/remote/favorite_respository.dart';
import 'package:mocktail/mocktail.dart';

class FavoriteRepositoryMock extends Mock implements FavoriteRepository {
  getStub(
          String url,
          String endPoint,
          Map<String, String> queryParament,
          Map<String, String> headers,
          Map<String, String> body,
          Future<Map<String, dynamic>> responses) =>
      when(() => getUser(
          url: url,
          endPoint: endPoint,
          queryParament: queryParament,
          headers: headers,
          body: body)).thenAnswer((_) async => responses);
}

void main() {
  late GetUserBloc sut;
  late FavoriteRepositoryMock favoriteRepositoryMock;
  final url = "api.themoviedb.org";
  final endPoint = "auth";
  final queryParament = {'pagenumber': '1'};
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0Mjg5MjEyZDkyOGE2NjQwYjM1YWQxYTJmMjI0NTYyMCIsInN1YiI6IjY0NWFjZDk1MWI3MGFlMDBlMmFjZWU5OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Hpo08dE3H1cjfwgHCUNSoUdzLAuXBUilCE6E8oVTJXo',
  };
  setUp(() {
    favoriteRepositoryMock = FavoriteRepositoryMock();
    sut = GetUserBloc(FavoriteRespositoryImpl(), SharePrefrencesAdapter());
  });
}

/* url: Constants.URL_API_FAVORITE,
        endPoint: 'auth',
        queryParament: {'pagenumber': '1'},
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }, */