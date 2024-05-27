import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:magicview/pages/movie_detail/components/show_image_favorite.dart';

class ImageFavoritePage extends StatefulWidget {
  final int id;
  const ImageFavoritePage({super.key, required this.id});

  @override
  State<ImageFavoritePage> createState() => _ImageFavoritePageState();
}

class _ImageFavoritePageState extends State<ImageFavoritePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteStateBloc>(
        builder: (context, state) {
      if (state is FavoriteImageExistState) {
        return ShowImageFavorite(fileNameImage: state.fileName);
      }
      if (state is FavoriteCreateImageSate) {
        return ShowImageFavorite(fileNameImage: state.fileName);
      } else {
        return const Text("");
      }
    });
  }
}
