import 'package:built_collection/built_collection.dart';
import 'package:dmp_flutter/config/api_client.dart';
import 'package:dmp_flutter/models/category.dart';
import 'package:dmp_flutter/models/generics/response.dart';
import 'package:dmp_flutter/models/provider.dart';

class CategoryService {
  static Future<BuiltList<Category>> getAll() async {
    final response = await ApiClient.getFrom("/categories");

    if (response.statusCode >= 200 && response.statusCode < 400) {
      print(response.body);
      var catResponse = CollectionResponse.fromJson<Category>(response.body);
      return catResponse.data;
    }

    //TODO Handle error states
    return BuiltList<Category>();
  }

  static Future<BuiltList<Provider>> getProvidersForCategory(String categoryId,
      {pageNum = 1}) async {
    final response = await ApiClient.getFrom(
        "/categories/$categoryId/providers?page=$pageNum");

    if (response.statusCode >= 200 && response.statusCode < 400) {
      print(response.body);
      var providersResponse = PagedResponse.fromJson<Provider>(response.body);
      return providersResponse.data;
    }

    //TODO Handle error states properly
    return BuiltList<Provider>();
  }
}
