import 'package:built_value/serializer.dart';
import 'package:dmp_flutter/models/category.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dmp_flutter/models/generics/response.dart';

part 'serializers.g.dart';

@SerializersFor(const [Category, CollectionResponse, ObjectResponse])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
