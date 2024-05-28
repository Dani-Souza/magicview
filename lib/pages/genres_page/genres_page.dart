import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/bloc/genres_bloc/genres_bloc.dart';
import 'package:magicview/bloc/movies_genres_popular_page.dart/movie_genres_popular_bloc.dart';
import 'package:magicview/pages/components/my_text.dart';

class GenresPage extends StatefulWidget {
  final String typeMovieOrFilme;
  const GenresPage({super.key, required this.typeMovieOrFilme});

  @override
  State<GenresPage> createState() => _GenresPageState();
}

class _GenresPageState extends State<GenresPage> {
  int positionGenres = 0;
  int pageInitial = 1;
  int genreIdsDefault = 28;
  // @override
  // void initState() {
  //   context.read<MovieGenresPopularBloc>().add(
  //       MovieGenresPopularEventByIdLoaded(
  //           genreIdsDefault, pageInitial, 'pt-br', widget.typeMovieOrFilme));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: BlocBuilder<GenresBloc, GenresState>(
        builder: (context, state) {
          if (state is GenresLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GenresErrorState) {
            return (MyText(title: state.error));
          }
          if (state is GenresLoadedState) {
            return ListView.separated(
              itemCount: state.genres.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 10),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 260,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: (index == positionGenres)
                      ? BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(5))
                      : BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        positionGenres = index;
                      });

                      context.read<MovieGenresPopularBloc>().add(
                          MovieGenresPopularEventByIdLoaded(
                              state.genres[index].id,
                              pageInitial,
                              'pt-br',
                              widget.typeMovieOrFilme));
                    },
                    child: Text(
                      '${state.genres[index].name}',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
