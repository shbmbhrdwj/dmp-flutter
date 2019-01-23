import 'package:built_collection/built_collection.dart';
import 'package:dmp_flutter/actions/action.dart';
import 'package:dmp_flutter/models/provider.dart';
import 'package:dmp_flutter/states/loading_state.dart';
import 'package:dmp_flutter/states/provider_list_state.dart';

class ProviderListReducer {
  static ProviderListState reduce(ProviderListState prevState, action) {
    if (action is ProviderSuccessAction) {
      BuiltList<Provider> providerList = action.result;
      return prevState.rebuild((builder) => builder
        ..providerList = providerList.toBuilder()
        ..loadingState = LoadingState.SUCCESS);
    }
    if (action is ProviderPendingAction) {
      return prevState
          .rebuild((builder) => builder..loadingState = LoadingState.LOADING);
    }
    if (action is ProviderFailedAction) {
      String error = action.error;
      return prevState.rebuild((builder) => builder
        ..error = error
        ..loadingState = LoadingState.ERROR);
    }
    return prevState;
  }
}
