import 'package:http/http.dart' as http;
import 'package:turna_tv/data/models/item_models/user.dart';
import 'dart:convert' as convert;
import 'services/api_service.dart';

class UserProvider {
  Future<User> getUserByEmail(String email, String password) async {
    var response = await http.post(
      ApiService.user,
      body: {
        "email": email,
        "password": password,
      },
    );
    var jsonResponse = convert.jsonDecode(response.body);
    User user = User.fromJson(jsonResponse['AUTHORIZATION'][0]);

    return user;
  }
}
