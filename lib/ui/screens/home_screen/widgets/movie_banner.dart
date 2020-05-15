import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/item_models/movie.dart';
import '../../../../data/providers/services/api_service.dart';
import '../../movie_detail_screen/movie_detail_screen.dart';

class MovieBanner extends StatelessWidget {
  final Movie movie;

  const MovieBanner({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MovieDetailScreen(
                movie: movie,
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: CachedNetworkImage(
            placeholderFadeInDuration: Duration(milliseconds: 500),
            fit: BoxFit.fill,
            width: 1400.0,
            height: MediaQuery.of(context).size.height * 0.3,
            imageUrl: ApiService.imgBase + movie.bigImgUrl,
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
