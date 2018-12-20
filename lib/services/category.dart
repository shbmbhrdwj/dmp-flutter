import 'package:dmp_flutter/config/api_client.dart';
import 'package:dmp_flutter/models/category.dart';
import 'package:dmp_flutter/models/response/category_response.dart';

class CategoryService {
  static Future<List<Category>> getAll() async {
    
    final response = await ApiClient.getFrom("/categories");

    if (response.statusCode >= 200 && response.statusCode < 400) {
      var catResponse = CategoryResponse.fromJson(response.body);
      return catResponse.data.asList();
    }

    //TODO Handle error states
    return [];
  }
}
