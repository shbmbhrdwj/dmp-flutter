library provider;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dmp_flutter/config/serializers.dart';

part 'provider.g.dart';

abstract class Provider implements Built<Provider, ProviderBuilder> {
  Provider._();

  factory Provider([updates(ProviderBuilder b)]) = _$Provider;

  @BuiltValueField(wireName: 'id')
  int get id;
  @BuiltValueField(wireName: 'name')
  String get name;
  @BuiltValueField(wireName: 'mobile_number')
  String get mobileNumber;
  @BuiltValueField(wireName: 'address_line_1')
  String get addressLine1;
  @BuiltValueField(wireName: 'address_line_2')
  @nullable
  String get addressLine2;
  @BuiltValueField(wireName: 'state')
  String get state;
  @BuiltValueField(wireName: 'city')
  String get city;
  @BuiltValueField(wireName: 'zip_code')
  String get zipCode;
  @BuiltValueField(wireName: 'latitude')
  double get latitude;
  @BuiltValueField(wireName: 'longitude')
  double get longitude;
  @BuiltValueField(wireName: 'rating')
  int get rating;
  String toJson() {
    return json.encode(serializers.serializeWith(Provider.serializer, this));
  }

  static Provider fromJson(String jsonString) {
    return serializers.deserializeWith(
        Provider.serializer, json.decode(jsonString));
  }

  static Serializer<Provider> get serializer => _$providerSerializer;
}
