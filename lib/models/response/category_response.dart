library category_response;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dmp_flutter/config/serializers.dart';
import 'package:dmp_flutter/models/category.dart';

part 'category_response.g.dart';

abstract class CategoryResponse
    implements Built<CategoryResponse, CategoryResponseBuilder> {
  CategoryResponse._();

  factory CategoryResponse([updates(CategoryResponseBuilder b)]) =
      _$CategoryResponse;

  @BuiltValueField(wireName: 'status')
  int get status;
  @BuiltValueField(wireName: 'message')
  String get message;
  @BuiltValueField(wireName: 'data')
  BuiltList<Category> get data;
  String toJson() {
    return json
        .encode(serializers.serializeWith(CategoryResponse.serializer, this));
  }

  static CategoryResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        CategoryResponse.serializer, json.decode(jsonString));
  }

  static Serializer<CategoryResponse> get serializer =>
      _$categoryResponseSerializer;
}