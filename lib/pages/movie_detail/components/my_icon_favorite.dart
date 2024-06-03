import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:magicview/entities/screen_arguments.dart';
import 'package:magicview/reposistories/local/favorite_local_repository.dart';

class MyIconFavorite extends StatefulWidget {
  final bool showIcon;
  final ScreenArguments argMovies;
  final GlobalKey genKey;
  final FavoriteLocalRepository favoriteLocalRepository;

  const MyIconFavorite(
      {super.key,
      required this.argMovies,
      required this.genKey,
      required this.favoriteLocalRepository,
      required this.showIcon});

  @override
  State<MyIconFavorite> createState() => _MyIconFavoriteState();
}

class _MyIconFavoriteState extends State<MyIconFavorite> {
  bool iconShow = false;

  Future<void> hasFavorite(int movieId, String userId) async {
    bool validIconShow =
        await widget.favoriteLocalRepository.existFavorite(movieId, userId);
    setState(() {
      iconShow = validIconShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return iconShow
        ? const Icon(
            Icons.favorite_sharp,
            color: Colors.redAccent,
            size: 40.0,
          )
        : InkWell(
            onTap: () {
              context.read<FavoriteBloc>().add(FavoriteCreateEvent(
                  screenArguments: widget.argMovies,
                  fileName: "MAGICVIEW",
                  genKey: widget.genKey));
            },
            child: const Icon(Icons.favorite_border,
                color: Colors.redAccent, size: 40.0));
  }
}
