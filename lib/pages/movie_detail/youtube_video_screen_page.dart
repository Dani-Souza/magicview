import 'package:flutter/material.dart';
import 'package:magicview/reposistories/credits_repository.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeScreenVideoPage extends StatefulWidget {
  final int movieId;
  final String typeMovieOrSerie;

  const YoutubeScreenVideoPage(
      {super.key, required this.movieId, required this.typeMovieOrSerie});

  @override
  State<YoutubeScreenVideoPage> createState() => _YoutubeScreenVideoPageState();
}

class _YoutubeScreenVideoPageState extends State<YoutubeScreenVideoPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: CreditsRepository.getTrailer(
            widget.movieId, "en", widget.typeMovieOrSerie),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return YoutubePlayer(
                controller: YoutubePlayerController(
                    initialVideoId: snapshot.data.toString(),
                    flags:
                        const YoutubePlayerFlags(autoPlay: true, mute: false)));
          } else {
            return Center(
              child: Text(
                "Não foi encontrado Trailer pra este filme",
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
            );
          }
        });
  }
}
