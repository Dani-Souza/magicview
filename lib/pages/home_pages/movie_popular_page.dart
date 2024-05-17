import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/app_routes.dart';
import 'package:magicview/bloc/movie_popular_bloc/movie_popular_bloc.dart';
import 'package:magicview/entities/screen_arguments.dart';
import 'package:magicview/utility/constants.dart';

class MoviePopularPages extends StatefulWidget {
  const MoviePopularPages({super.key});

  @override
  State<MoviePopularPages> createState() => _MoviePopularPagesState();
}

class _MoviePopularPagesState extends State<MoviePopularPages> {
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
      context
          .read<MoviePopularBloc>()
          .add(MoviePopularEventLoaded(page: pagina, langague: 'pt'));
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
            if (state is MoviePopularFetchsState) {
              return ListView.separated(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: state.result.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 10),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.detailMovie,
                          arguments: ScreenArguments(
                              state.result[index].id,
                              state.result[index].popularity,
                              state.result[index].title,
                              state.result[index].overview,
                              state.result[index].posterPath,
                              state.result[index].backdropPath,
                              state.result[index].voteAverage,
                              state.result[index].voteCount));
                    },
                    child: Container(
                      height: 204,
                      width: 136,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${Constants.IMAGEPOSTERURL}${state.result[index].posterPath}")),
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
