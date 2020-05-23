import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth_bloc/auth_bloc.dart';
import '../../../data/models/item_models/epizode.dart';
import '../../../data/models/item_models/movie.dart';
import '../../../data/providers/services/api_service.dart';
import '../profile_screen/widgets/info_dialog.dart';
import 'widgets/coming_soon.dart';
import 'widgets/epizode_scroller.dart';
import 'widgets/movie_detail_header.dart';
import 'widgets/people_scroller.dart';
import 'widgets/photo_scroller.dart';
import 'widgets/play_button.dart';
import 'widgets/story_line.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;
  MovieDetailScreen({@required this.movie});

  @override
  Widget build(BuildContext context) {
    bool isAllowed = context.bloc<AuthBloc>().isUserActive();

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLogedIn)
            showInfoDialog(context, 'добавлено в раздел смотреть позже');
          if (state is AuthDetailError) showInfoDialog(context, state.message);
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieDetailHeader(movie),
              movie.isMovie
                  ? _buildMovieControls(isAllowed, context)
                  : _buildSerialControls(isAllowed),
              _buildPhotoScroller(movie.screens),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Storyline(movie.detail),
              ),
              PeopleScroller(movie.people),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMovieControls(isAllowed, context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 12.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PlayButton(
              movieTitle: movie.title,
              iconData: Icons.play_arrow,
              title: 'Смотреть',
              url: movie.movieUrl,
              isAllowed: isAllowed,
            ),
            SizedBox(width: 12.0),
            PlayButton(
              movieTitle: movie.title,
              iconData: Icons.local_movies,
              title: 'Трейлер',
              url: movie.trailerUrl,
              isAllowed: true,
            ),
            SizedBox(width: 12.0),
            IconButton(
              color: Colors.green,
              icon: Icon(Icons.turned_in),
              onPressed: () {
                if (isAllowed) {
                  BlocProvider.of<AuthBloc>(context).add(
                    AddWatchLaterMovie(movie: movie),
                  );
                } else
                  showInfoDialog(context, 'Доступ только по подписке');
              },
            ),
          ],
        ));
  }

  Widget _buildSerialControls(isAllowed) {
    List<Widget> epizodes = [];
    for (Epizode epizode in movie.epizodes) {
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
