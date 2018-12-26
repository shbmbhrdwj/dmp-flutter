library category;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dmp_flutter/config/serializers.dart';

part 'category.g.dart';

abstract class Category implements Built<Category, CategoryBuilder> {
  Category._();

  factory Category([updates(CategoryBuilder b)]) = _$Category;

  int get id;
  String get name;

  String toJson() {
    return json.encode(serializers.serializeWith(Category.serializer, this));
  }

  static Category fromJson(String jsonString) {
    return serializers.deserializeWith(
        Category.serializer, json.decode(jsonString));
  }

  static Serializer<Category> get serializer => _$categorySerializer;
}
