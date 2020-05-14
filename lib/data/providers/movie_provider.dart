import 'package:http/http.dart' as http;
import 'package:turna_tv/data/models/item_models/movie.dart';
import 'dart:convert' as convert;
import 'services/api_service.dart';

class MovieProvider {
  Future<List<Movie>> getAll() async {
    List<Movie> movies = [];
    var moviesResponse = await http.get(ApiService.movies);
    var jsonResponse = convert.jsonDecode(moviesResponse.body);
    for (var json in jsonResponse['MOVIES']) {
      movies.add(Movie.fromJson(json));
    }
    return movies;
  }
}
