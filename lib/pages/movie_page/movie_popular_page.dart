import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/app_routes.dart';
import 'package:magicview/bloc/movie_popular_bloc/movie_popular_bloc.dart';
import 'package:magicview/entities/results.dart';
import 'package:magicview/entities/screen_arguments.dart';
import 'package:magicview/pages/components/my_text.dart';
import 'package:magicview/utility/constants.dart';

class MoviePopularPages extends StatefulWidget {
  final String typeMovieOrSerie;
  const MoviePopularPages({super.key, required this.typeMovieOrSerie});

  @override
  State<MoviePopularPages> createState() => _MoviePopularPagesState();
}

class _MoviePopularPagesState extends State<MoviePopularPages> {
  List<Results> result = [];
  final ScrollController _scrollController = ScrollController();
  int pagina = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMore);
  }

  void _loadMore() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      pagina++;
      context.read<MoviePopularBloc>().add(MoviePopularEventMoreLoad(
          page: pagina,
          langague: 'pt',
          results: result,
          typeMovieOrTv: widget.typeMovieOrSerie));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 204,
        child: BlocBuilder<MoviePopularBloc, MoviePopularState>(
          builder: (context, state) {
            if (state is MoviePopularLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is MoviePopularErrorState) {
              return (MyText(title: state.error));
            }
            if (state is MoviePopularFetchsState) {
              if (state.pageActual == 1) {
                result = state.result;
              } else {
                result += state.result;
              }

              return ListView.separated(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: result.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 10),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.detailMovie,
                          arguments: ScreenArguments(
                              result[index].id,
                              result[index].popularity,
                              result[index].title,
                              result[index].overview,
                              result[index].posterPath,
                              result[index].backdropPath,
                              result[index].voteAverage,
                              result[index].voteCount,
                              widget.typeMovieOrSerie));
                    },
                    child: Container(
                      height: 204,
                      width: 136,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${Constants.IMAGEPOSTERURL}${result[index].posterPath}")),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ));
  }
}
