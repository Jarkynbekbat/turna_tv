import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'services/api_service.dart';

class MovieProvider {
  Future<List<dynamic>> getAll() async {
    var moviesResponse = await http.get(ApiService.movies);
    var jsonResponse = convert.jsonDecode(moviesResponse.body);
    return jsonResponse['MOVIES'];
  }
}
