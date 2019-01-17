import 'dart:convert';

import 'package:dmp_flutter/config/api_client.dart';

class LoginService {
  static Future<Map<String, dynamic>> login(
      Map<String, String> loginCreds) async {
    print("In Login Service");
    var response = await ApiClient.postTo("/login", loginCreds);
    print("response --> " + response.toString());
    var jsonResponse = json.decode(response.body);
    return jsonResponse['data'];
  }
}
