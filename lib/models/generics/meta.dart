library meta;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dmp_flutter/config/serializers.dart';

part 'meta.g.dart';

abstract class Meta implements Built<Meta, MetaBuilder> {
  Meta._();

  factory Meta([updates(MetaBuilder b)]) = _$Meta;

  @BuiltValueField(wireName: 'current_page')
  int get currentPage;
  @nullable
  int get from;
  @BuiltValueField(wireName: 'last_page')
  int get lastPage;
  @BuiltValueField(wireName: 'path')
  String get path;
  @BuiltValueField(wireName: 'per_page')
  int get perPage;
  @BuiltValueField(wireName: 'to')
  @nullable
  int get to;
  @BuiltValueField(wireName: 'total')
  int get total;
  String toJson() {
    return json.encode(serializers.serializeWith(Meta.serializer, this));
  }

  static Meta fromJson(String jsonString) {
    return serializers.deserializeWith(
        Meta.serializer, json.decode(jsonString));
  }

  static Serializer<Meta> get serializer => _$metaSerializer;
}
