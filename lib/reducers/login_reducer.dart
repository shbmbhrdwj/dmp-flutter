import 'package:dmp_flutter/actions/action.dart';
import 'package:dmp_flutter/states/loading_state.dart';
import 'package:dmp_flutter/states/login_state.dart';

class LoginReducer {
  static LoginState reduce(LoginState prevState, action) {
    if (action is LoginPendingAction) {
      return prevState
          .rebuild((state) => state..loadingState = LoadingState.LOADING);
    }
    if (action is LoginSuccessAction) {
      Map<String, dynamic> result = action.result;

      return prevState.rebuild((state) => state
        ..authToken = result['token']
        ..isLoggedIn = true
        ..loadingState = LoadingState.SUCCESS);
    }
    if (action is LoginFailedAction) {
      String error = action.error.toString();

      return prevState.rebuild((state) => state
        ..loadingState = LoadingState.ERROR
        ..error = error);
    }
    return prevState;
  }
}
