import 'package:dmp_flutter/reducers/category_reducer.dart';
import 'package:dmp_flutter/reducers/login_reducer.dart';
import 'package:dmp_flutter/states/app_state.dart';
import 'package:dmp_flutter/states/category_state.dart';
import 'package:dmp_flutter/states/login_state.dart';

class PrimaryReducer {
  static AppState reduce(AppState prevState, action) {
    LoginState loginState = LoginReducer.reduce(prevState.loginState, action);
    CategoryState categoryState =
        CategoryReducer.reduce(prevState.categoryState, action);
    return prevState.rebuild((b) => b
      ..loginState = loginState.toBuilder()
      ..categoryState = categoryState.toBuilder());
  }
}
