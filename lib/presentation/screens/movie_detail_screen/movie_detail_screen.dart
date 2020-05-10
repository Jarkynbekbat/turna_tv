import 'package:flutter/material.dart';
import 'package:unicorndial/unicorndial.dart';
import 'package:better_player/better_player.dart';
import '../../../data/models/movie.dart';
import 'widgets/movie_detail_header.dart';
import 'widgets/photo_scroller.dart';
import 'widgets/story_line.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;
  MovieDetailScreen({@required this.movie});

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  BetterPlayerController _betterPlayerMovieController;
  BetterPlayerController _betterPlayerTrailerController;
  @override
  void initState() {
    super.initState();
    BetterPlayerDataSource betterPlayeMovieDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.NETWORK,
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    );
    _betterPlayerMovieController = BetterPlayerController(
        BetterPlayerConfiguration(),
        betterPlayerDataSource: betterPlayeMovieDataSource);

    BetterPlayerDataSource betterPlayeTrailerDataSource =
        BetterPlayerDataSource(
      BetterPlayerDataSourceType.NETWORK,
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    );
    _betterPlayerTrailerController = BetterPlayerController(
      BetterPlayerConfiguration(),
      betterPlayerDataSource: betterPlayeTrailerDataSource,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieDetailHeader(widget.movie),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Storyline(
                "movie.storylinestorylinmovie.storylinestorylinestormovie.storylinestomovie.storylinestorylinestormovie.storylinestorylinestormovie.storylinestorylinestorrylinestormovie.storylinestorylinestorestorylinestorylinestorylinestomovie.storylinestorylinestorylinestorylinestorylinestorylinestorylinestorylinestorylinestorylinerylinestorylinestorylinestorylinestoryline",
              ),
            ),
            PhotoScroller(
              photoUrls: [
                "https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_SX300.jpg",
                "https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_SX300.jpg",
                "https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_SX300.jpg",
                "https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_SX300.jpg",
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                'Фильм',
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .copyWith(fontSize: 18.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: BetterPlayer(
                controller: _betterPlayerMovieController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                'Трейлер',
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .copyWith(fontSize: 18.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: BetterPlayer(
                controller: _betterPlayerTrailerController,
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: UnicornDialer(
      //   backgroundColor: Colors.black.withOpacity(0.5),
      //   orientation: UnicornOrientation.VERTICAL,
      //   parentButton: Icon(Icons.play_arrow),
      //   hasNotch: false,
      //   childButtons: [
      //     UnicornButton(
      //       hasLabel: true,
      //       labelText: "Трейлер",
      //       currentButton: FloatingActionButton(
      //         heroTag: "trailer",
      //         mini: true,
      //         child: Icon(Icons.play_arrow),
      //         onPressed: () {},
      //       ),
      //     ),
      //     UnicornButton(
      //       hasLabel: true,
      //       labelText: "Фильм",
      //       currentButton: FloatingActionButton(
      //         heroTag: "movie",
      //         mini: true,
      //         child: Icon(Icons.play_arrow),
      //         onPressed: () {},
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}