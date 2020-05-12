import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:turna_tv/data/models/movie.dart';
import 'package:turna_tv/data/providers/services/api_service.dart';
import 'package:turna_tv/presentation/screens/movie_detail_screen/movie_detail_screen.dart';

import 'card_loading.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
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
        child: Column(
          children: <Widget>[
            Card(
              elevation: 10,
              child: Hero(
                tag: Random.secure(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    height: 180.0,
                    imageUrl: ApiService.imgBase + movie.smallImgUrl,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            cardLoading(context, url, downloadProgress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Avengers: Endgame",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
