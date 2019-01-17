import 'package:built_collection/built_collection.dart';
import 'package:dmp_flutter/actions/action.dart';
import 'package:dmp_flutter/models/category.dart';
import 'package:dmp_flutter/states/customer_home_state.dart';
import 'package:dmp_flutter/states/loading_state.dart';

class CustomerHomeReducer {
  static CustomerHomeState reduce(CustomerHomeState prevState, action) {
    if (action is CategoriesPendingAction) {
      return prevState
          .rebuild((state) => state..loadingState = LoadingState.LOADING);
    }
    if (action is CategoriesSuccessAction) {
      BuiltList<Category> categoryList = action.result;
      return prevState.rebuild((state) => state
        ..categoryList = categoryList.toBuilder()
        ..loadingState = LoadingState.SUCCESS);
    }
    if (action is CategoriesFailedAction) {
      String error = action.error;
      return prevState.rebuild((state) => state
        ..error = error
        ..loadingState = LoadingState.ERROR);
    }
    return prevState;
  }
}
