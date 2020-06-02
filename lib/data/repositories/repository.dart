import 'package:google_sign_in/google_sign_in.dart';

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

  Future<bool> removeWatchLaterMovie(int movieId) async {
    String token = user.token;

    bool res = await _userProvider.removeWatchLater(token, movieId);
    if (res) {
      user.watchLaterMovies.removeWhere((m) => m.id == movieId);
      LocalUserService.setUser(this.user);
      return true;
    } else
      return false;
  }

  Future<bool> initUserGoogle(GoogleSignInAccount account) async {
    this.user = await _userProvider.getUserByGoogle(account);
    await LocalUserService.setUser(this.user);
    return true;
  }

  Future<bool> initUserByEmail(String email, String password) async {
    this.user = await _userProvider.getUserByEmail(email, password);
    await LocalUserService.setUser(this.user);
    return true;
  }

  Future<bool> registrateUser({
    String login,
    String password,
    RegistrationType type,
    GoogleSignInAccount account,
  }) async {
    print('object');
    if (type == RegistrationType.email)
      await _registrateByEmail(login, password, type);
    else if (type == RegistrationType.google)
      await _registrateByGoogle(account, type);

    return true;
  }

  Future _registrateByGoogle(
      GoogleSignInAccount account, RegistrationType type) async {
    print('object');
    await _userProvider.registrate(account: account, type: type);
    await initUserGoogle(account);
  }

  Future _registrateByEmail(
      String login, String password, RegistrationType type) async {
    await _userProvider.registrate(
        login: login, password: password, type: type);
    await initUserByEmail(login, password);
  }
}
