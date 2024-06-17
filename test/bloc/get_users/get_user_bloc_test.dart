import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magicview/adapter/sharePreferencesAdapter.dart';
import 'package:magicview/bloc/get_users/get_user_bloc.dart';
import 'package:magicview/entities/user.dart';
import 'package:magicview/reposistories/remote/favorite_repositoy_impl.dart';
import 'package:magicview/utility/constants_sample.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_user_bloc_test.mocks.dart';

@GenerateMocks([FavoriteRespositoryImpl, SharePrefrencesAdapter])
void main() {
  late MockSharePrefrencesAdapter sharePrefrencesAdapter;
  late MockFavoriteRespositoryImpl favoriteRespositoryImpl;
  late List<User> users;

  setUp(() {
    sharePrefrencesAdapter = MockSharePrefrencesAdapter();
    favoriteRespositoryImpl = MockFavoriteRespositoryImpl();

    users = [
      const User(
        email: 'pontocom@gmail.com',
        id: '2',
        nick: 'PontoCom',
        password: '123456',
      ),
    ];
  });

  blocTest<GetUserBloc, GetUserStateBloc>(
    'emits [GetUserLoadingState, GetUserLoadedState] when [GetUserEvent] is added and fetch success.',
    build: () {
      when(sharePrefrencesAdapter.getToken())
          .thenAnswer((_) async => 'mockToken');
      when(
        favoriteRespositoryImpl.getUser(
          url: Constants.URL_API_FAVORITE,
          endPoint: 'auth',
          queryParament: {'pagenumber': '1'},
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer mockToken',
          },
        ),
      ).thenAnswer((_) async =>
          {'content': users.map((user) => user.toJson()).toList()});

      return GetUserBloc(favoriteRespositoryImpl, sharePrefrencesAdapter);
    },
    act: (bloc) => bloc.add(GetUserEvent()),
    expect: () => <GetUserStateBloc>[
      GetUserLoadingState(),
      GetUserLoadedState(user: users),
    ],
  );
}
