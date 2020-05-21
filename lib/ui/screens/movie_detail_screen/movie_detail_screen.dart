import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth_bloc/auth_bloc.dart';
import '../../../data/models/item_models/epizode.dart';
import '../../../data/models/item_models/movie.dart';
import '../../../data/providers/services/api_service.dart';
import 'widgets/coming_soon.dart';
import 'widgets/epizode_scroller.dart';
import 'widgets/movie_detail_header.dart';
import 'widgets/people_scroller.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isAllowed = context.bloc<AuthBloc>().isUserActive();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieDetailHeader(widget.movie),
            widget.movie.isMovie
                ? _buildMovieControls(isAllowed)
                : _buildSerialControls(isAllowed),
            _buildPhotoScroller(widget.movie.screens),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Storyline(widget.movie.detail),
            ),
            PeopleScroller(widget.movie.people),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieControls(isAllowed) {
    return Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 12.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PlayButton(
              movieTitle: widget.movie.title,
              iconData: Icons.play_arrow,
              title: 'Смотреть',
              url: widget.movie.movieUrl,
              isAllowed: isAllowed,
            ),
            SizedBox(width: 12.0),
            PlayButton(
              movieTitle: widget.movie.title,
              iconData: Icons.local_movies,
              title: 'Трейлер',
              url: widget.movie.trailerUrl,
              isAllowed: true,
            ),
            SizedBox(width: 12.0),
            IconButton(
              color: Colors.green,
              icon: Icon(Icons.turned_in),
              onPressed: () {},
            ),
          ],
        ));
  }

  Widget _buildSerialControls(isAllowed) {
    List<Widget> epizodes = [];
    for (Epizode epizode in widget.movie.epizodes) {
      if (epizode.series.length == 0)
        epizodes.add(ComingSoon());
      else
        epizodes.add(EpizodeScroller(
          epizode: epizode,
          isAllowed: isAllowed,
        ));
    }
    return Column(children: epizodes);
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
