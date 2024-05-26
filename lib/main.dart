import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/app_routes.dart';
import 'package:magicview/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:magicview/bloc/genres_bloc/genres_bloc.dart';
import 'package:magicview/bloc/movie_popular_bloc/movie_popular_bloc.dart';
import 'package:magicview/entities/results.dart';
import 'package:magicview/pages/movie_detail/datail_movie_page.dart';
import 'package:magicview/bloc/movies_genres_popular_page.dart/movie_genres_popular_bloc.dart';
import 'package:magicview/bloc/serie_popular_bloc/serie_popular_bloc.dart';
import 'package:magicview/pages/genres_page/genres_page.dart';
import 'package:magicview/pages/home_pages/homepage.dart';
import 'package:magicview/pages/home_pages/initial_home_page.dart';
import 'package:magicview/pages/movie_page/movie_popular_page.dart';
import 'package:magicview/pages/serie_page/serie_popular_page.dart';
import 'package:magicview/reposistories/genres_respository.dart';
import 'package:magicview/utility/create_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => MoviePopularBloc()
                ..add(MoviePopularEventLoaded(
                    page: 1, langague: 'pt-br', results: const <Results>[])),
              child: const MoviePopularPages()),
          BlocProvider(
              create: (context) =>
                  SeriePopularBloc()..add(SeriePopularEventFetchs(1, 'pt-br')),
              child: const SeriePopularPage()),
          BlocProvider(
              create: (context) =>
                  GenresBloc(GenresRepository())..add(GenresEventLoaded()),
              child: const GenresPage()),
          BlocProvider(
              create: (context) => MovieGenresPopularBloc()
                ..add(MovieGenresPopularEventByIdLoaded(28, 1, "pt-br")),
              child: const GenresPage()),
          BlocProvider(
            create: (context) =>
                FavoriteBloc(ImageCreate())..add(FavoritoImageDefault()),
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
              AppRoutes.initial: (context) => const InitialHomePage(),
              AppRoutes.homePage: (context) => const HomePage(),
              AppRoutes.detailMovie: (context) => const DetailMovePage(),
              AppRoutes.detailSerie: (context) => const DetailMovePage()
            }));
  }
}
