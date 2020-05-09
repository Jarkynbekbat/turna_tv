import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:turna_tv/data/models/movie.dart';
import 'package:turna_tv/presentation/screens/home_screen/widgets/movie_banner.dart';

class BannersCarousel extends StatelessWidget {
  final List<Movie> movies;
  const BannersCarousel({@required this.movies});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        MovieBanner(),
        MovieBanner(),
        MovieBanner(),
      ],
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        autoPlay: true,
        height: 250.0,
      ),
    );
  }
}
