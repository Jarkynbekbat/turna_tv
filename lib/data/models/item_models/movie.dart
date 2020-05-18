import 'actor.dart';
import 'company.dart';
import 'epizode.dart';
import 'genre.dart';
import 'producer.dart';
import 'scanarist.dart';

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
  List<Actor> actors;
  List<Scenarist> scenarios;
  List<Producer> producers;
  List<Company> companys;
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
      this.actors,
      this.scenarios,
      this.producers,
      this.companys,
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
    if (json['actors'] != null) {
      actors = List<Actor>();
      json['actors'].forEach((v) {
        actors.add(Actor.fromJson(v));
      });
    }
    if (json['scenarios'] != null) {
      scenarios = List<Scenarist>();
      json['scenarios'].forEach((v) {
        scenarios.add(Scenarist.fromJson(v));
      });
    }
    if (json['producers'] != null) {
      producers = List<Producer>();
      json['producers'].forEach((v) {
        producers.add(Producer.fromJson(v));
      });
    }
    if (json['companys'] != null) {
      companys = List<Company>();
      json['companys'].forEach((v) {
        companys.add(Company.fromJson(v));
      });
    }

    // TODO if (json['epizodes'] != null) {
    //   epizodes = List<Epizode>();
    //   json['epizodes'].forEach((v) {
    //     companys.add(Epizode.fromJson(v));
    //   });
    // }

    isMovie = json['isMovie'];
  }
}
