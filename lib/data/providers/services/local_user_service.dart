import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/item_models/user.dart';

class LocalUserService {
  static Future<bool> setUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('user', json.encode(user.toJson()));
  }

  static Future<dynamic> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var userString = prefs.getString('user');
      var userJson = json.decode(userString);

      print('object');
      User user = User.fromJson(userJson);

      return user;
    } catch (e) {
      return null;
    }
  }

  static Future<bool> deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('user');
  }
}
