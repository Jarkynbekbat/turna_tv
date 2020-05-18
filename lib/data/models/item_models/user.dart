import 'movie.dart';

class User {
  String login; // email or phone
  String name;

  bool isActive;
  DateTime isActiveBefore;

  int money;

  List<Movie> watchedMovies;
  List<Movie> watchLaterMovies;
}
