import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/app_routes.dart';
import 'package:magicview/bloc/genres_bloc/genres_bloc.dart';
import 'package:magicview/bloc/movie_popular_bloc/movie_popular_bloc.dart';
import 'package:magicview/pages/home_pages/datail_movie_page.dart';
import 'package:magicview/bloc/movies_genres_popular_page.dart/movie_genres_popular_bloc.dart';
import 'package:magicview/bloc/serie_popular_bloc/serie_popular_bloc.dart';
import 'package:magicview/pages/home_pages/genres_page.dart';
import 'package:magicview/pages/home_pages/homepage.dart';
import 'package:magicview/pages/home_pages/initial_home_page.dart';
import 'package:magicview/pages/home_pages/movie_popular_page.dart';
import 'package:magicview/pages/home_pages/serie_popular_page.dart';

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
              create: (context) =>
                  MoviePopularBloc()..add(MoviePopularEventInitial()),
              child: const MoviePopularPages()),
          BlocProvider(
              create: (context) =>
                  SeriePopularBloc()..add(SeriePopularEventInitial()),
              child: const SeriePopularPage()),
          BlocProvider(
              create: (context) => GenresBloc()..add(GenresEventInitial()),
              child: const GenresPage()),
          BlocProvider(
              create: (context) => MovieGenresPopularBloc()
                ..add(MovieGenresPopularEventById(28)),
              child: const GenresPage()),
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
              AppRoutes.initial: (context) => InitialHomePage(),
              AppRoutes.homePage: (context) => HomePage(),
              AppRoutes.detailMovie: (context) => DetailMovePage(),
            }));
  }
}
