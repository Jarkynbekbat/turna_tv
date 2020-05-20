import 'movie.dart';

class User {
  String name;
  String sname;
  String phone;
  String img;
  String password;
  String token;
  bool isActive;
  DateTime isActiveBefore;
  List<Movie> watchLaterMovies;

  User({
    this.name,
    this.sname,
    this.phone,
    this.img,
    this.password,
    this.token,
    this.isActive,
    this.isActiveBefore,
    this.watchLaterMovies,
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sname = json['sname'];
    phone = json['phone'];
    img = json['img'];
    password = json['password'];
    token = json['token'];
    isActive = json['isActive'];

    isActiveBefore = DateTime.parse(json['isActiveBefore']);
    if (json['watchLaterMovies'] != null) {
      watchLaterMovies = List<Movie>();
      json['watchLaterMovies'].forEach((v) {
        watchLaterMovies.add(Movie.fromJson(v));
      });
    }
  }
}
