import 'package:built_value/built_value.dart';
import 'package:dmp_flutter/states/customer_home_state.dart';
import 'package:dmp_flutter/states/login_state.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  LoginState get loginState;
  CustomerHomeState get customerHomeState;

  factory AppState.initialState() {
    return AppState((b) => b
      ..loginState = LoginState.initialState().toBuilder()
      ..customerHomeState = CustomerHomeState.initialState().toBuilder());
  }

//Add @nullable for nullable attributes
  AppState._();
  factory AppState([updates(AppStateBuilder b)]) = _$AppState;
}
