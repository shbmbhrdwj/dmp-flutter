import 'package:built_collection/built_collection.dart';
import 'package:dmp_flutter/config/api_client.dart';
import 'package:dmp_flutter/models/category.dart';
import 'package:dmp_flutter/models/generics/response.dart';

class CategoryService {
  static Future<BuiltList<Category>> getAll() async {
    final response = await ApiClient.getFrom("/categories");

    if (response.statusCode >= 200 && response.statusCode < 400) {
      var catResponse = CollectionResponse.fromJson<Category>(response.body);
      return catResponse.data;
    }

    //TODO Handle error states
    return new BuiltList<Category>();
  }
}
