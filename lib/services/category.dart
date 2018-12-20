import 'dart:convert';

import 'package:dmp_flutter/config/api_client.dart';
import 'package:dmp_flutter/config/serializers.dart';
import 'package:dmp_flutter/models/category.dart';
import 'package:dmp_flutter/models/response/category_response.dart';

class CategoryService {
  static Future<List<Category>> getAll() async {
    final response = await ApiClient.getFrom("/categories");

    if (response.statusCode >= 200 && response.statusCode < 400) {
      print(response.body);
      var responseJson = json.decode(response.body);
      // var categories = (responseJson['data']).map((categoryJson) {
      // print("categories => "+responseJson['data']);
      // print("category =>"+categoryJson.toString());

      // serializers.deserializeWith(Category.serializer, json.decode(testJson));
      var catResponse = CategoryResponse.fromJson(response.body);
      print("CatResponse"+catResponse.toString());
      // }).toList();ß
      return [];
    }

    //TODO Handle error states
    return List();
  }
}
