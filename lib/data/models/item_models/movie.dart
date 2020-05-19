import 'package:turna_tv/data/models/item_models/people.dart';

import 'people.dart';
import 'epizode.dart';
import 'genre.dart';

class Movie {
  String title;
  String detail;
  String language;
  String duration;
  String budget;
  String categoryName;
  String countryName;
  String smallImgUrl;
  String bigImgUrl;
  String trailerUrl;
  String movieUrl;

  int age;
  int year;
  int categoryId;
  int countryId;

  List<Genre> genres;
  List<String> screens;
  List<People> people;
  List<Epizode> epizodes;

  bool isMovie;

  Movie(
      {this.title,
      this.detail,
      this.language,
      this.duration,
      this.budget,
      this.age,
      this.year,
      this.categoryId,
      this.countryId,
      this.categoryName,
      this.countryName,
      this.smallImgUrl,
      this.bigImgUrl,
      this.trailerUrl,
      this.movieUrl,
      this.genres,
      this.screens,
      this.people,
      this.epizodes,
      this.isMovie});

  bool isNew() => this.year == DateTime.now().year;
  bool isForChildren() => this.age <= 6;
  dynamic getTag() =>
      this.isNew() ? "Новинка" : this.isForChildren() ? 'Дети' : null;

  Movie.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    detail = json['detail'];
    language = json['language'];
    duration = json['duration'];
    budget = json['budget'];
    categoryName = json['categoryName'];
    countryName = json['countryName'];
    smallImgUrl = json['smallImgUrl'];
    bigImgUrl = json['bigImgUrl'];
    trailerUrl = json['trailerUrl'];
    movieUrl = json['movieUrl'];

    age = int.parse(json['age']);
    year = int.parse(json['year']);
    categoryId = int.parse(json['categoryId']);
    countryId = int.parse(json['countryId']);

    if (json['genres'] != null) {
      genres = List<Genre>();
      json['genres'].forEach((v) {
        genres.add(Genre.fromJson(v));
      });
    }
    if (json['screens'] != null) {
      screens = List<String>();
      json['screens'].forEach((v) {
        screens.add(v['img']);
      });
    }
    if (json['people'] != null) {
      people = List<People>();
      json['people'].forEach((v) {
        people.add(People.fromJson(v));
      });
    }

    if (json['epizodes'] != null) {
      epizodes = List<Epizode>();
      json['epizodes'].forEach((v) {
        epizodes.add(Epizode.fromJson(v));
      });
    }

    isMovie = json['isMovie'];
  }
}
