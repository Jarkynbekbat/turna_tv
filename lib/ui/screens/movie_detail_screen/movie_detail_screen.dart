import 'package:flutter/material.dart';

import '../../../data/models/item_models/movie.dart';
import 'widgets/movie_detail_header.dart';
import 'widgets/play_button.dart';
import 'widgets/story_line.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;
  MovieDetailScreen({@required this.movie});

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  // BetterPlayerController _betterPlayerMovieController;
  // BetterPlayerController _betterPlayerTrailerController;
  @override
  void initState() {
    super.initState();
    //   BetterPlayerDataSource betterPlayeMovieDataSource = BetterPlayerDataSource(
    //     BetterPlayerDataSourceType.NETWORK,
    //     "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    //   );
    //   _betterPlayerMovieController = BetterPlayerController(
    //       BetterPlayerConfiguration(),
    //       betterPlayerDataSource: betterPlayeMovieDataSource);

    //   BetterPlayerDataSource betterPlayeTrailerDataSource =
    //       BetterPlayerDataSource(
    //     BetterPlayerDataSourceType.NETWORK,
    //     "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    //   );
    //   _betterPlayerTrailerController = BetterPlayerController(
    //     BetterPlayerConfiguration(),
    //     betterPlayerDataSource: betterPlayeTrailerDataSource,
    //   );
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
              padding: const EdgeInsets.only(left: 18.0, top: 12.0),
              child: Row(
                children: <Widget>[
                  PlayButton(
                    movieTitle: widget.movie.title,
                    icon: Icon(Icons.play_arrow),
                    title: 'Смотреть',
                    url: widget.movie.movieUrl,
                  ),
                  SizedBox(width: 12.0),
                  PlayButton(
                    movieTitle: widget.movie.title,
                    icon: Icon(Icons.local_movies),
                    title: 'Трейлер',
                    url: widget.movie.trailerUrl,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Storyline(widget.movie.detail),
            ),
            _buildPhotoScroller(widget.movie.screenImg),
            // Padding(
            //   padding: const EdgeInsets.only(left: 18.0),
            //   child: Text(
            //     'Фильм',
            //     style: Theme.of(context)
            //         .textTheme
            //         .subhead
            //         .copyWith(fontSize: 18.0),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(18.0),
            //   child: BetterPlayer(
            //     controller: _betterPlayerMovieController,
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 18.0),
            //   child: Text(
            //     'Трейлер',
            //     style: Theme.of(context)
            //         .textTheme
            //         .subhead
            //         .copyWith(fontSize: 18.0),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(18.0),
            //   child: BetterPlayer(
            //     controller: _betterPlayerTrailerController,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoScroller(List<dynamic> imgs) {
    // TODO Монстр глубины
    // if (imgs.length != 0) {
    //   return PhotoScroller(
    //     photoUrls: imgs.map((e) => e['link']).toList(),
    //   );
    // } else
    return Text('');
  }
}
