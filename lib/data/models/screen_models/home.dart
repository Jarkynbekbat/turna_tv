import 'package:flutter/foundation.dart';

import '../item_models/movie.dart';

class HomeScreenModel {
  final List<Movie> movies;
  HomeScreenModel({@required this.movies});

  List<Movie> getNewMovies() {
    return this.movies.where((m) => m.isNew()).toList();
  }

  List<Movie> getRecomendedMovies() {
    return this.movies;
  }

  List<Movie> getMoviesForSlider() {
    return this.movies;
  }

  List<Movie> getMoviesForChildren() {
    return this.movies.where((m) => m.isForChildren()).toList();
  }
}
