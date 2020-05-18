import 'package:flutter/material.dart';
import 'package:turna_tv/data/providers/services/api_service.dart';
import 'package:turna_tv/ui/screens/movie_detail_screen/widgets/actors_scroller.dart';

import '../../../data/models/item_models/movie.dart';
import 'widgets/movie_detail_header.dart';
import 'widgets/photo_scroller.dart';
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
              padding:
                  const EdgeInsets.only(left: 16.0, top: 12.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  PlayButton(
                    movieTitle: widget.movie.title,
                    iconData: Icons.play_arrow,
                    title: 'Смотреть',
                    url: widget.movie.movieUrl,
                  ),
                  SizedBox(width: 12.0),
                  PlayButton(
                    movieTitle: widget.movie.title,
                    iconData: Icons.local_movies,
                    title: 'Трейлер',
                    url: widget.movie.trailerUrl,
                  ),
                  SizedBox(width: 12.0),
                  IconButton(
                    color: Colors.green,
                    icon: Icon(Icons.turned_in),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            _buildPhotoScroller(widget.movie.screens),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Storyline(widget.movie.detail),
            ),
            ActorScroller(widget.movie.actors),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoScroller(List<String> imgs) {
    if (imgs.length != 0) {
      return PhotoScroller(
        photoUrls: imgs.map((url) => ApiService.imgBase + url).toList(),
      );
    } else
      return Text('');
  }
}
