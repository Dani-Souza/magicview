import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/bloc/favorite_bloc/favorite_bloc.dart';

class ImagePosterPage extends StatefulWidget {
  final String posterPath;
  final GlobalKey genKey;
  const ImagePosterPage({
    super.key,
    required this.posterPath,
    required this.genKey,
  });

  @override
  State<ImagePosterPage> createState() => _ImagePosterPageState();
}

class _ImagePosterPageState extends State<ImagePosterPage> {
  //int _favoriteCount = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteStateBloc>(
        builder: ((context, state) {
      if (state is FavoriteLoadingState) {
        return const CircularProgressIndicator();
      }

      if (state is FavoriteAddNickAndNumberState) {
        return RepaintBoundary(
            key: widget.genKey,
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                SizedBox(
                  height: 148,
                  width: 98,
                  child: Container(
                    height: 148,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://media.themoviedb.org/t/p/w220_and_h330_face/${widget.posterPath}"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.purple, width: 3)),
                    child: Baseline(
                        baseline: 126,
                        baselineType: TextBaseline.alphabetic,
                        child: Center(
                          child: Text(
                            state.nick,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.amber[50],
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary),
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: Container(
                    alignment: Alignment.center,
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.purple,
                    ),
                    child: Text(
                      state.numberFavorite.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ));
      } else {
        return Container(
          height: 204,
          width: 136,
          margin: const EdgeInsets.only(left: 16, top: 110),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://media.themoviedb.org/t/p/w500${widget.posterPath}}"),
            ),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary,
                offset: const Offset(
                  0.0,
                  0.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2,
              ), //BoxShadow
              const BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
          ),
        );
      }
    }));
  }
}
