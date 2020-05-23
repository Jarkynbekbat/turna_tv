import 'package:flutter/material.dart';

import '../../../../data/models/item_models/movie.dart';
import '../../../../data/providers/services/api_service.dart';
import 'acr_bunner_image.dart';
import 'poster.dart';

class MovieDetailHeader extends StatelessWidget {
  MovieDetailHeader(this.movie);
  final Movie movie;

  List<Widget> _buildGenreChips(TextTheme textTheme) {
    return movie.genres.map((genre) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Chip(
          label: Text(genre.title),
          labelStyle: textTheme.caption,
          backgroundColor: Colors.black12,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    var movieInformation = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.title,
          style: textTheme.bodyText2,
        ),
        SizedBox(height: 8.0),
        Text(
          'год: ${movie.year}, ${movie.age}',
          style: textTheme.bodyText2.copyWith(fontSize: 16.0),
        ),
        // RatingInformation(movie),
        SizedBox(height: 8.0),
        Wrap(children: _buildGenreChips(textTheme)),
      ],
    );

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 140.0),
          child: ArcBannerImage(ApiService.imgBase + movie.bigImgUrl),
        ),
        Positioned(
          bottom: 0.0,
          left: 16.0,
          right: 16.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Poster(
                ApiService.imgBase + movie.smallImgUrl,
                height: 180.0,
              ),
              SizedBox(width: 16.0),
              Expanded(child: movieInformation),
            ],
          ),
        ),
      ],
    );
  }
}
