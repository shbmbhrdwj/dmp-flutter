import 'package:built_value/serializer.dart';
import 'package:dmp_flutter/models/category.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dmp_flutter/models/generics/links.dart';
import 'package:dmp_flutter/models/generics/meta.dart';
import 'package:dmp_flutter/models/generics/response.dart';
import 'package:dmp_flutter/models/provider.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Category,
  Provider,
  CollectionResponse,
  ObjectResponse,
  PagedResponse,
  Links,
  Meta
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
