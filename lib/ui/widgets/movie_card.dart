import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/models/item_models/movie.dart';
import '../../data/providers/services/api_service.dart';
import '../screens/movie_detail_screen/movie_detail_screen.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(
              movie: movie,
            ),
          ),
        );
      },
      child: Card(
        elevation: 10,
        child: Hero(
          tag: Random.secure(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              height: 180.0,
              imageUrl: ApiService.imgBase + movie.smallImgUrl,
              // progressIndicatorBuilder:
              //     (context, url, downloadProgress) =>
              //       ,
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}