import 'genre.dart';

class Category {
  int id;
  String title;
  List<Genre> genres;

  Category({this.id, this.title, this.genres});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['genres'] != null) {
      genres = List<Genre>();
      json['genres'].forEach((v) {
        genres.add(Genre.fromJson(v));
      });
    }
  }
}
