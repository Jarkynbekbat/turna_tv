import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:turna_tv/data/providers/services/device_info_service.dart';

import '../../ui/screens/registration_screen/registration_screen.dart';
import '../models/item_models/user.dart';
import 'services/api_service.dart';

class UserProvider {
  Future<User> getUserByEmail(String email, String password) async {
    var response = await http.post(
      ApiService.user,
      body: {
        "email": email,
        "password": password,
        "ip": await getIP(),
        "device": await getModel(),
        "platform": getPlatform(),
      },
    );

    print('object');
    var jsonResponse = convert.jsonDecode(response.body);

    if (jsonResponse == 488) throw Exception([jsonResponse, email, password]);
    if (jsonResponse == 401) throw Exception(jsonResponse);

    User user = User.fromJson(jsonResponse['AUTHORIZATION'][0]);

    return user;
  }

  Future<bool> registrate(
      String login, String password, RegistrationType type) async {
    switch (type) {
      case RegistrationType.email:
        return await _registrateByEmail(login, password);
        break;

      default:
        throw Exception('данная функция в разработке');
    }
  }

  Future<bool> addWatchLater(String token, int movieId) async {
    Response response = await http.post(
      ApiService.addWatchLater,
      body: {
        "token": token,
        "movieId": movieId.toString(),
      },
    );

    if (response.statusCode == 200)
      return true;
    else
      return false;
  }

  Future<bool> _registrateByEmail(String login, String password) async {
    Response response = await http.post(
      ApiService.registrate,
      body: {
        "email": login,
        "name": login,
        "password": password,
        "connpass": password,
        "ip": await getIP(),
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else
      throw Exception('не удалось , проверьте интернет соединение!');
  }
}
