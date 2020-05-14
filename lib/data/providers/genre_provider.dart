import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import '../models/item_models/genre.dart';
import 'services/api_service.dart';

class GenreProvider {
  Future<List<Genre>> getAll() async {
    List<Genre> genres = [];
    var genresResponse = await http.get(ApiService.genres);
    var jsonResponse = convert.jsonDecode(genresResponse.body);

    for (var json in jsonResponse['genres']) {
      genres.add(Genre.fromMap(json));
    }

    // return genres;
    // List<Genre> genres = [];
    // genres.add(Genre(id: 1, name: "драма"));
    // genres.add(Genre(id: 2, name: "Приключения"));
    // genres.add(Genre(id: 3, name: "Приключения"));
    // genres.add(Genre(id: 4, name: "Боевик"));
    // genres.add(Genre(id: 5, name: "Ужасы"));

    return genres;
  }
}
