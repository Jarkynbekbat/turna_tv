import 'package:turna_tv/data/models/movie.dart';
import 'package:turna_tv/data/providers/movie_provider.dart';

class Repository {
  MovieProvider _movieProvider = MovieProvider();

  List<Movie> movies = [];

  Future<bool> initAll() async {
    var raws = await _movieProvider.getAll();

    for (var raw in raws) {
      this.movies.add(Movie.fromJson(raw));
    }
    print('object');
  }
}
