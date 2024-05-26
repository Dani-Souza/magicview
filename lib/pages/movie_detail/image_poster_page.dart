import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/bloc/favorite_bloc/favorite_bloc.dart';

class ImagePosterPage extends StatefulWidget {
  final String posterPath;
  const ImagePosterPage({super.key, required this.posterPath});

  @override
  State<ImagePosterPage> createState() => _ImagePosterPageState();
}

class _ImagePosterPageState extends State<ImagePosterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteStateBloc>(
        builder: ((context, state) {
      if (state is FavoriteLoadingState) {
        return Text("data");
      }
      if (state is FavoriteDefaultImageState) {
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
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
          ),
        );
      }
      if (state is FavoriteAddNickAndNumberState) {
        return const Text("aa");
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
                offset: const Offset(0.0, 0.0),
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
