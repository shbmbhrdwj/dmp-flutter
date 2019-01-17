import 'package:built_collection/built_collection.dart';
import 'package:dmp_flutter/middlewares/future.dart';
import 'package:dmp_flutter/middlewares/thunk.dart';
import 'package:dmp_flutter/models/category.dart';
import 'package:dmp_flutter/services/category.dart';
import 'package:dmp_flutter/services/login.dart';
import 'package:dmp_flutter/states/app_state.dart';
import 'package:redux/redux.dart';

CheckThunkAction<AppState> startLoginAction(Map<String, dynamic> loginCreds) {
  void myFunc(Store<AppState> store) {
    store.dispatch(LoginAction(LoginService.login(loginCreds)));
  }

  return myFunc;
}

class LoginAction extends FutureAction {
  LoginAction(this.future);

  final Future<Map<String, dynamic>> future;

  @override
  getFailedAction() {
    return LoginFailedAction();
  }

  @override
  getPendingAction() {
    return LoginPendingAction();
  }

  @override
  getSuccessAction() {
    return LoginSuccessAction();
  }
}

class LoginPendingAction {}

class LoginSuccessAction extends FutureSuccessAction {}

class LoginFailedAction extends FutureFailedAction {}

void fetchCategories(Store<AppState> store) {
  store.dispatch(CategoriesAction(CategoryService.getAll()));
}

class CategoriesAction extends FutureAction {
  CategoriesAction(this.future);

  final Future<BuiltList<Category>> future;

  @override
  getFailedAction() {
    return CategoriesFailedAction();
  }

  @override
  getPendingAction() {
    return CategoriesPendingAction();
  }

  @override
  getSuccessAction() {
    return CategoriesSuccessAction();
  }
}

class CategoriesPendingAction {}

class CategoriesSuccessAction extends FutureSuccessAction {}

class CategoriesFailedAction extends FutureFailedAction {}
