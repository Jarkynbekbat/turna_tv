import 'package:flutter/foundation.dart';

import 'movie.dart';

class HomeScreenModel {
  final List<Movie> movies;
  HomeScreenModel({@required this.movies});

  List<Movie> getNewMovies() {
    return this.movies;
  }

  List<Movie> getRecomendedMovies() {
    return this.movies;
  }

  List<Movie> getMoviesForSlider() {
    return this.movies;
  }
}
