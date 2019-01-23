import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dmp_flutter/config/serializers.dart';
import 'package:dmp_flutter/models/generics/links.dart';
import 'package:dmp_flutter/models/generics/meta.dart';

part 'response.g.dart';

abstract class ObjectResponse<T>
    with _BaseResponse
    implements Built<ObjectResponse<T>, ObjectResponseBuilder<T>> {
  static Serializer<ObjectResponse> get serializer =>
      _$objectResponseSerializer;

  T get data;

  ObjectResponse._();
  factory ObjectResponse([updates(ObjectResponseBuilder<T> b)]) =
      _$ObjectResponse<T>;

  static FullType _getSpecifiedType<T>() {
    return FullType(ObjectResponse, [FullType(T)]);
  }

  static Serializers _getBuiltSerializer<T>() {
    final SerializersBuilder serializersWithBuilder = serializers.toBuilder()
      ..addBuilderFactory(
          _getSpecifiedType<T>(), () => new ObjectResponseBuilder<T>());
    return serializersWithBuilder.build();
  }

  static ObjectResponse<T> fromJson<T>(String jsonResponse) {
    return _getBuiltSerializer<T>().deserialize(json.decode(jsonResponse),
        specifiedType: _getSpecifiedType<T>());
  }

  String toJson() {
    return _getBuiltSerializer<T>()
        .serialize(this, specifiedType: _getSpecifiedType<T>());
  }
}

abstract class CollectionResponse<T>
    with _BaseResponse
    implements Built<CollectionResponse<T>, CollectionResponseBuilder<T>> {
  static Serializer<CollectionResponse> get serializer =>
      _$collectionResponseSerializer;

  BuiltList<T> get data;

  CollectionResponse._();
  factory CollectionResponse([updates(CollectionResponseBuilder<T> b)]) =
      _$CollectionResponse<T>;

  static FullType _getSpecifiedType<T>() {
    return FullType(CollectionResponse, [FullType(T)]);
  }

  static Serializers _getBuiltSerializer<T>() {
    final SerializersBuilder serializersWithBuilder = serializers.toBuilder()
      ..addBuilderFactory(
          _getSpecifiedType<T>(), () => new CollectionResponseBuilder<T>())
      ..addBuilderFactory(
          FullType(BuiltList, [FullType(T)]), () => new ListBuilder<T>());

    return serializersWithBuilder.build();
  }

  static CollectionResponse<T> fromJson<T>(String jsonResponse) {
    return _getBuiltSerializer<T>().deserialize(json.decode(jsonResponse),
        specifiedType: _getSpecifiedType<T>());
  }

  String toJson() {
    return _getBuiltSerializer<T>()
        .serialize(this, specifiedType: _getSpecifiedType<T>());
  }
}

abstract class PagedResponse<T>
    with _BaseResponse
    implements Built<PagedResponse<T>, PagedResponseBuilder<T>> {
  static Serializer<PagedResponse> get serializer => _$pagedResponseSerializer;

  BuiltList<T> get data;
  Links get links;
  Meta get meta;

  PagedResponse._();
  factory PagedResponse([updates(PagedResponseBuilder<T> b)]) =
      _$PagedResponse<T>;

  static FullType _getSpecifiedType<T>() {
    return FullType(PagedResponse, [FullType(T)]);
  }

  static Serializers _getBuiltSerializer<T>() {
    final SerializersBuilder serializersWithBuilder = serializers.toBuilder()
      ..addBuilderFactory(
          _getSpecifiedType<T>(), () => new PagedResponseBuilder<T>())
      ..addBuilderFactory(
          FullType(BuiltList, [FullType(T)]), () => new ListBuilder<T>());

    return serializersWithBuilder.build();
  }

  static PagedResponse<T> fromJson<T>(String jsonResponse) {
    return _getBuiltSerializer<T>().deserialize(json.decode(jsonResponse),
        specifiedType: _getSpecifiedType<T>());
  }

  String toJson() {
    return _getBuiltSerializer<T>()
        .serialize(this, specifiedType: _getSpecifiedType<T>());
  }
}

abstract class _BaseResponse {
  int get status;
  String get message;
}
