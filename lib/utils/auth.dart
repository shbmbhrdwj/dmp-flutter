import 'dart:convert';

import 'package:dmp_flutter/config/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  static String _token;

  static Future<String> getToken() async {
    if (_token == null || _token.isEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _token = prefs.getString("authToken");
    }
    return _token;
  }

  static Future<bool> validToken() async {
    String token = await getToken();
    if (token == null || token.isEmpty)
      return Future<bool>.delayed(Duration(milliseconds: 250), () => false);

    var response = await ApiClient.getFrom("/user");
    //TODO Check response status should be in 200 series
    Map<String, dynamic> body = json.decode(response.body);
    if (body["status"] == null)
      return false;
    else if (body["status"] < 0) return false;

    return true;
  }
}
