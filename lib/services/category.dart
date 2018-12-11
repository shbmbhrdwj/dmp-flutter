import 'dart:convert';

import 'package:dmp_flutter/config/ApiClient.dart';
import 'package:dmp_flutter/models/category.dart';

class CategoryService {
  static Future<List<Category>> getAll() async {
    final response = await ApiClient.getFrom("/categories");

    if (response.statusCode >= 200 && response.statusCode < 400) {
      var responseJson = json.decode(response.body);
      var categories = (responseJson['data'] as List)
          .map((categoryJson) => Category.fromJson(categoryJson))
          .toList();

      return categories;
    }

    //TODO Handle error states
    return List();
  }
}
