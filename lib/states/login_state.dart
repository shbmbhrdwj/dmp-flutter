import 'package:built_value/built_value.dart';
import 'package:dmp_flutter/states/loading_state.dart';

part 'login_state.g.dart';

abstract class LoginState implements Built<LoginState, LoginStateBuilder> {
  String get authToken;
  bool get isLoggedIn;
  LoadingState get loadingState;
  String get error;

  LoginState._();
  factory LoginState([updates(LoginStateBuilder b)]) = _$LoginState;

  factory LoginState.initialState() {
    return LoginState((b) => b
      ..authToken = ""
      ..isLoggedIn = false
      ..error = ""
      ..loadingState = LoadingState.UNKNOWN);
  }
}
