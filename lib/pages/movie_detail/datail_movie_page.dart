import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:magicview/bloc/get_favorite_bloc/get_favorite_bloc.dart';
import 'package:magicview/entities/credits.dart';
import 'package:magicview/entities/screen_arguments.dart';
import 'package:magicview/pages/components/my_text.dart';
import 'package:magicview/pages/components/my_text_title.dart';
import 'package:magicview/pages/movie_detail/components/image_favorite_page.dart';
import 'package:magicview/pages/movie_detail/components/image_poster_page.dart';
import 'package:magicview/pages/movie_detail/youtube_video_screen_page.dart';
import 'package:magicview/reposistories/credits_repository.dart';
import 'package:magicview/reposistories/local/favorite_local_repository.dart';

class DetailMovePage extends StatefulWidget {
  const DetailMovePage({super.key});

  @override
  State<DetailMovePage> createState() => _DetailMovePageState();
}

class _DetailMovePageState extends State<DetailMovePage> {
  final GlobalKey genKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    ScreenArguments? argMovies =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    context.read<FavoriteBloc>().add(FavoriteShowImageSaved(id: argMovies.id));
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                //figurinha

                Stack(
                  children: [
                    Container(
                      height: screenHeight * 0.51,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            opacity: .2,
                            image: NetworkImage(
                                "https://media.themoviedb.org/t/p/w500${argMovies.backdropPath}"),
                            fit: BoxFit.fill),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Text(
                                argMovies.title!,
                                style: TextStyle(
                                  color: const Color(0xFFF1EBF9),
                                  fontFamily: "Righteous",
                                  fontSize:
                                      argMovies.title!.length > 12 ? 28 : 38,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ImagePosterPage(
                      posterPath: argMovies.posterPath,
                      genKey: genKey,
                    ),
                    //   ImageFavoritePage(),
                    ImageFavoritePage(id: argMovies.id),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              context
                                  .read<GetFavoriteBloc>()
                                  .add(GetFavoriteImageSaveLocal());
                            },
                            child: const MyTextTitle(message: " < MAGICVIEW")),
                        InkWell(
                            onTap: () {
                              context.read<FavoriteBloc>().add(
                                  FavoriteCreateEvent(
                                      screenArguments: argMovies,
                                      fileName: "MAGICVIEW",
                                      genKey: genKey));
                            },
                            child: const Icon(Icons.favorite_border,
                                color: Colors.redAccent, size: 40.0)),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
                  child: Container(
                    height: screenHeight * .40,
                    width: screenWidth,
                    child: Column(
                      children: [
                        TabBar(
                          indicatorColor: Colors.amber,
                          dividerColor: Colors.transparent,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          tabs: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: MyText(title: "SINOPSE"),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: MyText(title: "ELENCO"),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: MyText(title: "TRAILER"),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: SizedBox(
                            height: screenHeight * .35,
                            width: screenWidth,
                            child: TabBarView(
                              children: [
                                MyText(
                                  title: "${argMovies.overview} ",
                                  fontSize: 14,
                                ),
                                FutureBuilder(
                                  future: CreditsRepository.getCredits(
                                      argMovies.id,
                                      "en-US",
                                      argMovies.typeMovieOrTV),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      List<Credits>? movieCredits =
                                          snapshot.data;
                                      return SingleChildScrollView(
                                        child: Wrap(
                                          alignment: WrapAlignment.spaceEvenly,
                                          spacing:
                                              5.0, // gap between adjacent chips
                                          runSpacing: 20.0,
                                          direction: Axis.horizontal,
                                          children: <Widget>[
                                            for (var i = 0;
                                                i < movieCredits!.length;
                                                i++)
                                              // if (movieCredits[i].profilePath !=
                                              //     null)
                                              Container(
                                                height: 93,
                                                width: 64,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/${movieCredits[i].profilePath}")),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Baseline(
                                                  baseline: 89,
                                                  baselineType:
                                                      TextBaseline.alphabetic,
                                                  child: Text(
                                                    movieCredits[i].character,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .secondary,
                                                        fontSize: 10,
                                                        backgroundColor:
                                                            Theme.of(context)
                                                                .colorScheme
                                                                .primary),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                ),
                                YoutubeScreenVideoPage(
                                    movieId: argMovies.id,
                                    typeMovieOrSerie: argMovies.typeMovieOrTV)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  checkFavorite(int id) {
    FavoriteLocalRepository favoritelocal = FavoriteLocalRepository();
    return favoritelocal.existFavorite(id);
  }
}
