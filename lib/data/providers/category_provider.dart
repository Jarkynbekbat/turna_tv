import 'package:turna_tv/data/models/item_models/category.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:turna_tv/data/providers/services/api_service.dart';

class CategoryProvider {
  Future<List<Category>> getAll() async {
    List<Category> categories = [];
    var categoriesResponse = await http.get(ApiService.categories);
    var jsonResponse = convert.jsonDecode(categoriesResponse.body);

    for (var json in jsonResponse['CATEGORIES']) {
      categories.add(Category.fromJson(json));
    }

    return categories;

    // List<Category> categories = [];
    // categories.add(Category(id: 2, name: "Фильмы"));
    // categories.add(Category(id: 3, name: "Мультфильмы"));
    // categories.add(Category(id: 5, name: "Документальные фильмы"));
  }
}
