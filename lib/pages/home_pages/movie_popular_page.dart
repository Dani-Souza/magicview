import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/bloc/movie_popular_bloc/movie_popular_bloc.dart';

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
                itemCount: state.results.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 10),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 204,
                    width: 136,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://media.themoviedb.org/t/p/w220_and_h330_face/${state.results[index].posterPath}")),
                        borderRadius: BorderRadius.circular(5)),
                  );
                },
              );
            }
            return Container();
          },
        ));
  }
}
