import 'package:built_collection/built_collection.dart';
import 'package:dmp_flutter/middlewares/future.dart';
import 'package:dmp_flutter/middlewares/thunk.dart';
import 'package:dmp_flutter/models/category.dart';
import 'package:dmp_flutter/models/provider.dart';
import 'package:dmp_flutter/services/category.dart';
import 'package:dmp_flutter/services/login.dart';
import 'package:dmp_flutter/states/app_state.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThunkAction<AppState> startLoginAction(Map<String, dynamic> loginCreds) {
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

ThunkAction<AppState> saveToPrefs(String key, dynamic value) {
  return (Store<AppState> store) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is List<String>)
      prefs.setStringList(key, value);
    else
      switch (value.runtimeType) {
        case bool:
          prefs.setBool(key, value);
          break;
        case double:
          prefs.setDouble(key, value);
          break;
        case int:
          prefs.setInt(key, value);
          break;
        default:
          prefs.setString(key, value.toString());
      }
  };
}

ThunkAction<AppState> fetchProvidersForCategory(String categoryId,
    {int pageNum = 1}) {
  return (Store<AppState> store) {
    store.dispatch(FetchProviderAction(
        CategoryService.getProvidersForCategory(categoryId, pageNum: pageNum)));
  };
}

class FetchProviderAction extends FutureAction {
  final Future<BuiltList<Provider>> future;

  FetchProviderAction(this.future);

  @override
  getFailedAction() {
    return ProviderFailedAction();
  }

  @override
  getPendingAction() {
    return ProviderPendingAction();
  }

  @override
  getSuccessAction() {
    return ProviderSuccessAction();
  }
}

class ProviderPendingAction {}

class ProviderSuccessAction extends FutureSuccessAction {}

class ProviderFailedAction extends FutureFailedAction {}
