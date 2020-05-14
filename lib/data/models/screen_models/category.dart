import 'package:turna_tv/data/models/item_models/category.dart';
import 'package:turna_tv/data/models/item_models/genre.dart';
import 'package:turna_tv/data/models/item_models/movie.dart';

class CategoryScreenModel {
  final List<Movie> movies;
  final List<Category> categories;
  final List<Genre> genres;

  const CategoryScreenModel({
    this.movies,
    this.categories,
    this.genres,
  });

  List<Movie> getMoviesByCategoryId(int categoryId) {
    return this.movies.where((m) => m.categoryId == categoryId).toList();
  }

  List<Genre> getGenresByCategoryId(int categoryId) {
    return this.genres.where((g) => g.categoryId == categoryId).toList();
  }

  List<Movie> getMoviesByCategoryAndGenreIds(int categoryId, int genreId) {
    return this.movies.where((m) => m.categoryId == categoryId);
  }
}
