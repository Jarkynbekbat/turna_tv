import '../models/item_models/category.dart';
import '../models/item_models/genre.dart';
import '../models/item_models/movie.dart';
import '../providers/category_provider.dart';
import '../providers/genre_provider.dart';
import '../providers/movie_provider.dart';

class Repository {
  MovieProvider _movieProvider = MovieProvider();
  CategoryProvider _categoryProvider = CategoryProvider();
  GenreProvider _genreProvider = GenreProvider();

  List<Movie> movies = [];
  List<Category> categories = [];
  List<Genre> genres = [];

  Future<bool> initAll() async {
    this.genres = await _genreProvider.getAll();
    this.categories = await _categoryProvider.getAll();
    this.movies = await _movieProvider.getAll();

    print('object');

    return true;
  }
}
