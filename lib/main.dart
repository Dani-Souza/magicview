import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/adapter/sharePreferencesAdapter.dart';
import 'package:magicview/app_routes.dart';
import 'package:magicview/bloc/add_new_user/add_new_user_bloc.dart';
import 'package:magicview/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:magicview/bloc/genres_bloc/genres_bloc.dart';
import 'package:magicview/bloc/get_favorite_bloc/get_favorite_bloc.dart';
import 'package:magicview/bloc/get_favorite_by_user/get_favorite_by_user_id_bloc.dart';
import 'package:magicview/bloc/get_my_favorite/get_my_favorite_bloc.dart';
import 'package:magicview/bloc/get_users/get_user_bloc.dart';
import 'package:magicview/bloc/login_user_bloc/login_user_bloc.dart';
import 'package:magicview/bloc/movie_popular_bloc/movie_popular_bloc.dart';
import 'package:magicview/entities/results.dart';
import 'package:magicview/pages/login_page/login_page.dart';
import 'package:magicview/pages/movie_detail/datail_movie_page.dart';
import 'package:magicview/bloc/movies_genres_popular_page.dart/movie_genres_popular_bloc.dart';
import 'package:magicview/bloc/serie_popular_bloc/serie_popular_bloc.dart';
import 'package:magicview/pages/genres_page/genres_page.dart';
import 'package:magicview/pages/home_pages/homepage.dart';
import 'package:magicview/pages/movie_page/movie_popular_page.dart';
import 'package:magicview/pages/serie_page/serie_popular_page.dart';
import 'package:magicview/pages/user_page/add_user_page.dart';
import 'package:magicview/pages/user_page/list_user_page.dart';
import 'package:magicview/reposistories/genres_respository.dart';
import 'package:magicview/reposistories/local/favorite_local_repository.dart';
import 'package:magicview/reposistories/remote/favorite_repositoy_impl.dart';
import 'package:magicview/utility/hive_initialize.dart';
import 'package:magicview/utility/local_create_image.dart';

void main() async {
  HiveInitialize.initializeHive();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final loginUserBloc =
      LoginUserBloc(FavoriteRespositoryImpl(), SharePrefrencesAdapter());
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetMyFavoriteBloc(
                FavoriteRespositoryImpl(), SharePrefrencesAdapter()),
          ),
          BlocProvider(
              create: (context) => LoginUserBloc(
                  FavoriteRespositoryImpl(), SharePrefrencesAdapter()),
              child: LoginPage(
                loginUserBloc: loginUserBloc,
              )),
          BlocProvider(
            create: (context) => GetFavoriteByUserIdBloc(
                FavoriteRespositoryImpl(), SharePrefrencesAdapter()),
          ),
          BlocProvider(
              create: (context) => GetUserBloc(
                  FavoriteRespositoryImpl(), SharePrefrencesAdapter())
                ..add(GetUserEvent()),
              child: const ListUserPage()),
          BlocProvider(
            create: (context) => AddNewUserBloc(
                FavoriteRespositoryImpl(), SharePrefrencesAdapter()),
          ),
          BlocProvider(
              create: (context) => MoviePopularBloc(SharePrefrencesAdapter())
                ..add(MoviePopularEventLoaded(
                    page: 1,
                    langague: 'pt-br',
                    results: const <Results>[],
                    typeMovieOrTv: "movie")),
              child: const MoviePopularPages(typeMovieOrSerie: "movie")),
          BlocProvider(
              create: (context) =>
                  SeriePopularBloc()..add(SeriePopularEventFetchs(1, 'pt-br')),
              child: const SeriePopularPage()),
          BlocProvider(
              create: (context) => GenresBloc(GenresRepository())
                ..add(GenresEventSubmit(typeMovieOrSerie: "movie")),
              child: const GenresPage(typeMovieOrFilme: "movie")),
          BlocProvider(
              create: (context) => MovieGenresPopularBloc(
                  SharePrefrencesAdapter())
                ..add(
                    MovieGenresPopularEventByIdLoaded(28, 1, "pt-br", "movie")),
              child: const GenresPage(
                typeMovieOrFilme: "movie",
              )),
          BlocProvider(
            create: (context) => FavoriteBloc(
                LocalImageCreate(),
                FavoriteLocalRepository(),
                FavoriteRespositoryImpl(),
                SharePrefrencesAdapter()),
          ),
          BlocProvider(
            create: (context) => GetFavoriteBloc(FavoriteLocalRepository(),
                SharePrefrencesAdapter(), LocalImageCreate())
              ..add(GetFavoriteImageSaveLocal()),
          )
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MAGICVIEW',
            theme: ThemeData(
              fontFamily: 'Open Sans',
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
                background: const Color(0xff21005D),
                secondary: const Color(0xfFD0BCFD),
              ),
              useMaterial3: true,
            ),
            initialRoute: AppRoutes.initial,
            routes: {
              AppRoutes.initial: (context) => LoginPage(
                    loginUserBloc: loginUserBloc,
                  ),
              //AppRoutes.initial: (context) => const ListUserPage(),
              AppRoutes.homePage: (context) => const HomePage(),
              AppRoutes.detailMovie: (context) => DetailMovePage(
                  favoriteLocalRepository: FavoriteLocalRepository()),
              AppRoutes.addNewUser: (context) => const AddUserPage(),
            }));
  }
}
