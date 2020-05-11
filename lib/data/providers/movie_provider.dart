import 'package:http/http.dart' as http;
import 'package:turna_tv/data/providers/services/api_service.dart';

class MovieProvider {
  Future<List<dynamic>> getAll() async {
    var moviesResponse = await http.get(ApiService.movies);

    print('object');
    return [];
  }
}
