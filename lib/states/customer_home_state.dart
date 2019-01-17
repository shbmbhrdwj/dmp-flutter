import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:dmp_flutter/models/category.dart';
import 'package:dmp_flutter/states/loading_state.dart';

part 'customer_home_state.g.dart';

abstract class CustomerHomeState
    implements Built<CustomerHomeState, CustomerHomeStateBuilder> {
  BuiltList<Category> get categoryList;
  LoadingState get loadingState;
  String get error;

  CustomerHomeState._();
  factory CustomerHomeState([updates(CustomerHomeStateBuilder b)]) =
      _$CustomerHomeState;

  factory CustomerHomeState.initialState() {
    return CustomerHomeState((builder) => builder
      ..loadingState = LoadingState.UNKNOWN
      ..error = ""
      ..categoryList = BuiltList<Category>().toBuilder());
  }
}
