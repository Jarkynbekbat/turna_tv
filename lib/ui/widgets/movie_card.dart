import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/models/item_models/movie.dart';
import '../../data/providers/services/api_service.dart';
import '../screens/movie_detail_screen/movie_detail_screen.dart';
import 'card_loading.dart';

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
      child: Stack(
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
                  placeholder: (context, url) => CardShimmer(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          ),
          movie.getTag() != null
              ? Positioned(
                  top: 10.0,
                  child: Container(
                    padding: EdgeInsets.all(3.0),
                    child: Text(
                      movie.getTag(),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
