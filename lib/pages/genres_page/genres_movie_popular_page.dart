import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/app_routes.dart';
import 'package:magicview/bloc/movies_genres_popular_page.dart/movie_genres_popular_bloc.dart';
import 'package:magicview/entities/results.dart';
import 'package:magicview/entities/screen_arguments.dart';
import 'package:magicview/pages/components/my_text.dart';

class GenresMoviePopularPage extends StatefulWidget {
  final String typeMovieOrTv;
  const GenresMoviePopularPage({super.key, required this.typeMovieOrTv});

  @override
  State<GenresMoviePopularPage> createState() => _GenresMoviePopularPageState();
}

class _GenresMoviePopularPageState extends State<GenresMoviePopularPage> {
  List<Results> results = [];
  int pageInitial = 1;
  int genresId = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  initState() {
    _scrollController.addListener(_loadMore); // TODO: implement initState
    super.initState();
  }

  void _loadMore() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      pageInitial++;
      context.read<MovieGenresPopularBloc>().add(MovieEventGenresMoreLoadById(
          genresId, pageInitial, "pt", widget.typeMovieOrTv));
    }
  }

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
            genresId = state.genresId;
            if (state.page == 1) {
              results = state.results;
            } else {
              results += state.results;
            }

            return ListView.separated(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: results.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                width: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.detailMovie,
                        arguments: ScreenArguments(
                            results[index].id,
                            state.userId,
                            results[index].popularity,
                            results[index].title,
                            results[index].overview,
                            results[index].posterPath,
                            results[index].backdropPath,
                            results[index].voteAverage,
                            results[index].voteCount,
                            widget.typeMovieOrTv));
                  },
                  child: Container(
                    height: 50,
                    width: 92,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://media.themoviedb.org/t/p/w220_and_h330_face/${results[index].posterPath}")),
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
