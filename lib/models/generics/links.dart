library links;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dmp_flutter/config/serializers.dart';

part 'links.g.dart';

abstract class Links implements Built<Links, LinksBuilder> {
  Links._();

  factory Links([updates(LinksBuilder b)]) = _$Links;

  @nullable
  String get first;
  @nullable
  String get last;
  @nullable
  String get prev;
  @nullable
  String get next;
  String toJson() {
    return json.encode(serializers.serializeWith(Links.serializer, this));
  }

  static Links fromJson(String jsonString) {
    return serializers.deserializeWith(
        Links.serializer, json.decode(jsonString));
  }

  static Serializer<Links> get serializer => _$linksSerializer;
}
