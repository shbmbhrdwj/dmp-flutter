import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:dmp_flutter/models/category.dart';
import 'package:dmp_flutter/states/loading_state.dart';
import 'package:dmp_flutter/states/provider_list_state.dart';

part 'category_state.g.dart';

abstract class CategoryState
    implements Built<CategoryState, CategoryStateBuilder> {
  BuiltList<Category> get categoryList;
  LoadingState get loadingState;
  ProviderListState get providerListState;
  String get error;

  CategoryState._();
  factory CategoryState([updates(CategoryStateBuilder b)]) = _$CategoryState;

  factory CategoryState.initialState() {
    return CategoryState((builder) => builder
      ..loadingState = LoadingState.UNKNOWN
      ..providerListState = ProviderListState.initialState().toBuilder()
      ..error = ""
      ..categoryList = BuiltList<Category>().toBuilder());
  }
}
