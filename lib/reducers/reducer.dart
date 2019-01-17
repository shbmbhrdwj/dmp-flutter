import 'package:dmp_flutter/reducers/customer_home_reducer.dart';
import 'package:dmp_flutter/reducers/login_reducer.dart';
import 'package:dmp_flutter/states/app_state.dart';
import 'package:dmp_flutter/states/customer_home_state.dart';
import 'package:dmp_flutter/states/login_state.dart';

class PrimaryReducer {
  static AppState reduce(AppState prevState, action) {
    LoginState loginState = LoginReducer.reduce(prevState.loginState, action);
    CustomerHomeState customerHomeState =
        CustomerHomeReducer.reduce(prevState.customerHomeState, action);
    return prevState.rebuild((b) => b
      ..loginState = loginState.toBuilder()
      ..customerHomeState = customerHomeState.toBuilder());
  }
}
