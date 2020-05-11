import 'package:turna_tv/data/models/movie.dart';
import 'package:turna_tv/data/providers/movie_provider.dart';

class Repository {
  MovieProvider _movieProvider = MovieProvider();

  List<Movie> movies = [];

  Future<bool> initAll() async {
    var raws = _movieProvider.getAll();
  }
}
