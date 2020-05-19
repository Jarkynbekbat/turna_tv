import '../item_models/category.dart';
import '../item_models/genre.dart';
import '../item_models/movie.dart';

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
    List<Genre> genresT =
        this.genres.where((g) => g.categoryId == categoryId).toList();

    List<Genre> filtredGenres = genresT
        .where((g) =>
            this.getMoviesByCategoryAndGenreName(categoryId, g.title).length !=
            0)
        .toList();
    return filtredGenres;
  }

  List<Movie> getMoviesByCategoryAndGenreName(int categoryId, String genre) {
    return this
        .movies
        .where(
          (m) =>
              m.categoryId == categoryId &&
              m.genres.map((e) => e.title).contains(genre),
        )
        .toList();
  }
}
