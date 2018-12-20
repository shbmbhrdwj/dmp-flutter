import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:dmp_flutter/models/category.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dmp_flutter/models/response/category_response.dart';

part 'serializers.g.dart';

@SerializersFor(const [CategoryResponse, Category])
Serializers serializers = _$serializers;

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
