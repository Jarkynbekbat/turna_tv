import 'dart:convert' as convert;

import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../ui/screens/registration/registration_screen.dart';
import '../models/item_models/user.dart';
import 'services/api_service.dart';
import 'services/device_info_service.dart';

class UserProvider {
  // login
  Future<User> getUserByEmail(String email, String password) async {
    var response = await http.post(
      ApiService.userByEmail,
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

  Future<User> getUserByGoogle(GoogleSignInAccount account) async {
    var response = await http.post(
      ApiService.userByGoogle,
      body: {
        "email": account.email,
        "token":
            "f2c81624ceb87d693fd306c0251bc27fb86114401197829250cfb4f107b4ef73",
        "ip": await getIP(),
        "device": await getModel(),
        "platform": getPlatform(),
      },
    );

    print('object');
    var jsonResponse = convert.jsonDecode(response.body);
    if (jsonResponse == 488) throw Exception([jsonResponse, account]);
    if (jsonResponse == 401) throw Exception(jsonResponse);
    User user = User.fromJson(jsonResponse['AUTHORIZATION'][0]);
    return user;
  }

  // registration interface
  Future<bool> registrate({
    String login,
    String password,
    RegistrationType type,
    GoogleSignInAccount account,
  }) async {
    switch (type) {
      case RegistrationType.email:
        return await _registrateByEmail(login, password);
        break;
      case RegistrationType.google:
        return await _registrateByGoogle(account);

      default:
        throw Exception('данная функция в разработке');
    }
  }
  // registration back

  Future<bool> _registrateByEmail(String login, String password) async {
    Response response = await http.post(
      ApiService.registrateByEmail,
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

  Future<bool> _registrateByGoogle(GoogleSignInAccount account) async {
    Response response = await http.post(
      ApiService.registrateByGoogle,
      body: {
        "name": account.displayName,
        "email": account.email,
        "password": account.id,
        "image": account.photoUrl,
        "ip": await getIP(),
      },
    );
    print('object');
    if (response.statusCode == 200) {
      return true;
    } else
      throw Exception('не удалось , проверьте интернет соединение!');
  }

  // other
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
}
