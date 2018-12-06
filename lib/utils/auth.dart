import 'package:dmp_flutter/config/ApiClient.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  static String token;

  static init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("authToken");
  }

  static Future<bool> validToken() async {
    if (token == null || token.isEmpty)
      return Future<bool>.delayed(Duration(milliseconds: 250), () => false);

    var response = await ApiClient.getFrom("/user");
    print(response.body);
    return false;
  }
}
