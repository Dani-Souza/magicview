import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/bloc/serie_popular_bloc/serie_popular_bloc.dart';
import 'package:magicview/utility/utilities.dart';

class SeriePopularPage extends StatefulWidget {
  const SeriePopularPage({super.key});

  @override
  State<SeriePopularPage> createState() => _SeriePopularPageState();
}

class _SeriePopularPageState extends State<SeriePopularPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 204,
        child: BlocBuilder<SeriePopularBloc, SeriePopularState>(
          builder: (context, state) {
            if (state is SeriePopularStateInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SeriePopularStateFetchs) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.resultSeriePopular.length,
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
                                "${Utilities.urlImagePath}/${state.resultSeriePopular[index].posterPath}")),
                        borderRadius: BorderRadius.circular(5)),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
