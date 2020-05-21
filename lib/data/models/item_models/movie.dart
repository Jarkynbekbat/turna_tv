import 'conpany.dart';
import 'epizode.dart';
import 'genre.dart';
import 'people.dart';

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
  List<Company> companys;
  List<Epizode> epizodes;

  bool isMovie;

  Movie({
    this.title,
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
    this.companys,
    this.epizodes,
    this.isMovie,
  });

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
    age = json['age'];
    year = json['year'];
    categoryId = json['categoryId'];
    countryId = json['countryId'];
    categoryName = json['categoryName'];
    countryName = json['countryName'];
    smallImgUrl = json['smallImgUrl'];
    bigImgUrl = json['bigImgUrl'];
    trailerUrl = json['trailerUrl'];
    movieUrl = json['movieUrl'];

    if (json['genres'] != null) {
      genres = List<Genre>();
      json['genres'].forEach((v) {
        genres.add(Genre.fromJson(v));
      });
    }
    if (json['screens'] != null) {
      screens = List<String>();
      json['screens'].forEach((v) {
        screens.add(v);
      });
    }
    if (json['people'] != null) {
      people = List<People>();
      json['people'].forEach((v) {
        people.add(People.fromJson(v));
      });
    }
    if (json['companys'] != null) {
      companys = List<Company>();
      json['companys'].forEach((v) {
        companys.add(Company.fromJson(v));
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['detail'] = this.detail;
    data['language'] = this.language;
    data['duration'] = this.duration;
    data['budget'] = this.budget;
    data['age'] = this.age;
    data['year'] = this.year;
    data['categoryId'] = this.categoryId;
    data['countryId'] = this.countryId;
    data['categoryName'] = this.categoryName;
    data['countryName'] = this.countryName;
    data['smallImgUrl'] = this.smallImgUrl;
    data['bigImgUrl'] = this.bigImgUrl;
    data['trailerUrl'] = this.trailerUrl;
    data['movieUrl'] = this.movieUrl;
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    if (this.screens != null) {
      data['screens'] = this.screens;
    }
    if (this.people != null) {
      data['people'] = this.people.map((v) => v.toJson()).toList();
    }
    if (this.companys != null) {
      data['companys'] = this.companys.map((v) => v.toJson()).toList();
    }
    if (this.epizodes != null) {
      data['epizodes'] = this.epizodes.map((v) => v.toJson()).toList();
    }
    data['isMovie'] = this.isMovie;
    return data;
  }
}
