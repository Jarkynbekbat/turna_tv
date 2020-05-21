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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['sname'] = this.sname;
    data['phone'] = this.phone;
    data['img'] = this.img;
    data['token'] = this.token;
    data['isActive'] = this.isActive;
    data['isActiveBefore'] = this.isActiveBefore.toString();
    if (this.watchLaterMovies != null) {
      data['watchLaterMovies'] =
          this.watchLaterMovies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
