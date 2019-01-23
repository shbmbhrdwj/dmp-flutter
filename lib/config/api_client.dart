import 'package:dmp_flutter/utils/auth.dart';
import 'package:http/http.dart';

class ApiClient {
  static String baseUrl = "https://dmp.faimtech.in/api";

  static Future<Map<String, String>> _getHeader() async {
    String token = await Auth.getToken();
    return {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
  }

  static Future<Response> getFrom(String endPoint) async {
    Response response =
        await get(baseUrl + endPoint, headers: await _getHeader());
    _log(response);
    return response;
  }

  static Future<Response> postTo(
      String endPoint, Map<String, String> body) async {
    Response response =
        await post(baseUrl + endPoint, body: body, headers: await _getHeader());
    _log(response);
    return response;
  }

  static _log(Response response) {
    // print(response.headers.toString());
    // print(response.body);
  }
}
