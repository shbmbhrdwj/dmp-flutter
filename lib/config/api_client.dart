import 'package:dmp_flutter/utils/auth.dart';
import 'package:http/http.dart';

class ApiClient {
  static String baseUrl = "https://dmp.faimtech.in/api";

  static Map<String, String> _getHeader() {
    return {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Auth.token}'
    };
  }

  static Future<Response> getFrom(String endPoint) {
    return get(baseUrl + endPoint, headers: _getHeader());
  }

  static Future<Response> postTo(String endPoint, Map<String, String> body) {
    return post(baseUrl + endPoint, body: body, headers: _getHeader());
  }
}
