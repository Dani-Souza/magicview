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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 204,
        child: BlocBuilder<MoviePopularBloc, MoviePopularState>(
          builder: (context, state) {
            if (state is MoviePopularStateInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is MoviePopularStateFetchs) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.result.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 10),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.detailMovie,
                          arguments: ScreenArguments(state.result[index].id));
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
