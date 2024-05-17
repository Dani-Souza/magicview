import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/bloc/genres_bloc/genres_bloc.dart';
import 'package:magicview/bloc/movies_genres_popular_page.dart/movie_genres_popular_bloc.dart';

class GenresPage extends StatefulWidget {
  const GenresPage({super.key});

  @override
  State<GenresPage> createState() => _GenresPageState();
}

class _GenresPageState extends State<GenresPage> {
  int positionGenres = 0;
  int genreIdsDefault = 28;
  @override
  void initState() {
    context
        .read<MovieGenresPopularBloc>()
        .add(MovieGenresPopularEventById(genreIdsDefault));
    super.initState();
  }

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
                          MovieGenresPopularEventById(state.genres[index].id));
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
