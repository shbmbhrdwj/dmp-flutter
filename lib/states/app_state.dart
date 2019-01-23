import 'package:built_value/built_value.dart';
import 'package:dmp_flutter/states/category_state.dart';
import 'package:dmp_flutter/states/login_state.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  LoginState get loginState;
  CategoryState get categoryState;

  factory AppState.initialState() {
    return AppState((b) => b
      ..loginState = LoginState.initialState().toBuilder()
      ..categoryState = CategoryState.initialState().toBuilder());
  }

//Add @nullable for nullable attributes
  AppState._();
  factory AppState([updates(AppStateBuilder b)]) = _$AppState;
}
