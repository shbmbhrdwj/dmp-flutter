import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:dmp_flutter/models/provider.dart';
import 'package:dmp_flutter/states/loading_state.dart';

part 'provider_list_state.g.dart';

abstract class ProviderListState
    implements Built<ProviderListState, ProviderListStateBuilder> {
  BuiltList<Provider> get providerList;
  LoadingState get loadingState;
  String get error;

  ProviderListState._();

  factory ProviderListState([updates(ProviderListStateBuilder b)]) =
      _$ProviderListState;

  factory ProviderListState.initialState() {
    return ProviderListState((builder) => builder
      ..error = ""
      ..providerList = BuiltList<Provider>().toBuilder()
      ..loadingState = LoadingState.UNKNOWN);
  }
}
