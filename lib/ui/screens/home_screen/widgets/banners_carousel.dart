import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/item_models/movie.dart';
import 'movie_banner.dart';

class BannersCarousel extends StatelessWidget {
  final List<Movie> movies;
  const BannersCarousel({@required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: CarouselSlider(
        items:
            List.generate(movies.length, (i) => MovieBanner(movie: movies[i])),
        options: CarouselOptions(
          viewportFraction: 0.93,

          // enlargeCenterPage: true,
          autoPlay: true,
          height: MediaQuery.of(context).size.height * 0.3,
        ),
      ),
    );
  }
}
