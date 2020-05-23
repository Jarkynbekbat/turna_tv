import '../../ui/screens/registration/registration_screen.dart';
import '../models/item_models/category.dart';
import '../models/item_models/genre.dart';
import '../models/item_models/movie.dart';
import '../models/item_models/user.dart';
import '../providers/category_provider.dart';
import '../providers/genre_provider.dart';
import '../providers/movie_provider.dart';
import '../providers/services/local_user_service.dart';
import '../providers/user_provider.dart';

class Repository {
  MovieProvider _movieProvider = MovieProvider();
  CategoryProvider _categoryProvider = CategoryProvider();
  GenreProvider _genreProvider = GenreProvider();
  UserProvider _userProvider = UserProvider();

  List<Movie> movies = [];
  List<Category> categories = [];
  List<Genre> genres = [];
  User user;

  Future<bool> initAll() async {
    this.genres = await _genreProvider.getAll();
    this.categories = await _categoryProvider.getAll();
    this.movies = await _movieProvider.getAll();
    this.user = await LocalUserService.getUser();

    print('object');
    return true;
  }

  Future<bool> addWatchLaterMovie(int movieId) async {
    String token = user.token;

    bool res = await _userProvider.addWatchLater(token, movieId);
    if (res) {
      Movie movie = movies.firstWhere((m) => m.id == movieId);
      user.watchLaterMovies.add(movie);
      LocalUserService.setUser(this.user);
      return true;
    } else
      return false;
  }

  Future<bool> initUserByEmail(String email, String password) async {
    this.user = await _userProvider.getUserByEmail(email, password);
    await LocalUserService.setUser(this.user);
    return true;
  }

  Future<bool> registrateUser(
      String login, String password, RegistrationType type) async {
    if (type == RegistrationType.email) {
      await _userProvider.registrate(login, password, type);
      await initUserByEmail(login, password);
    }

    return true;
  }
}
