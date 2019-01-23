import 'package:redux/redux.dart';

thunkMiddleware<State>(Store<State> store, action, NextDispatcher next) {
  if (action is ThunkAction<State>) {
    action(store);
  } else
    next(action);
}

typedef void ThunkAction<State>(Store<State> store);
