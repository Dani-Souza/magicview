import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeScreenVideoPage extends StatefulWidget {
  const YoutubeScreenVideoPage({super.key});

  @override
  State<YoutubeScreenVideoPage> createState() => _YoutubeScreenVideoPageState();
}

class _YoutubeScreenVideoPageState extends State<YoutubeScreenVideoPage> {
  String? videoId;

  @override
  void initState() {
    super.initState();
    videoId = 'lfFV4MnfmKw';
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
        controller: YoutubePlayerController(
            initialVideoId: videoId!,
            flags: const YoutubePlayerFlags(autoPlay: true, mute: false)));
  }
}
