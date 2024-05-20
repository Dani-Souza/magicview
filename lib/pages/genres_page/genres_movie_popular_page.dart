import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/app_routes.dart';
import 'package:magicview/bloc/movies_genres_popular_page.dart/movie_genres_popular_bloc.dart';
import 'package:magicview/entities/screen_arguments.dart';
import 'package:magicview/pages/components/my_text.dart';

class GenresMoviePopularPage extends StatefulWidget {
  const GenresMoviePopularPage({super.key});

  @override
  State<GenresMoviePopularPage> createState() => _GenresMoviePopularPageState();
}

class _GenresMoviePopularPageState extends State<GenresMoviePopularPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 138,
      child: BlocBuilder<MovieGenresPopularBloc, MovieGenresPopularState>(
        builder: (context, state) {
          if (state is MovieGenresPopularStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MovieGenresPopularErrorState) {
            return (MyText(title: state.error));
          }
          if (state is MovieGenresPopularStateFetchs) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.results.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                width: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.detailMovie,
                        arguments: ScreenArguments(
                            state.results[index].id,
                            state.results[index].popularity,
                            state.results[index].title,
                            state.results[index].overview,
                            state.results[index].posterPath,
                            state.results[index].backdropPath,
                            state.results[index].voteAverage,
                            state.results[index].voteCount,
                            "movie"));
                  },
                  child: Container(
                    height: 50,
                    width: 92,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://media.themoviedb.org/t/p/w220_and_h330_face/${state.results[index].posterPath}")),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
