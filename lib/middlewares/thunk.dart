import 'package:redux/redux.dart';

thunkMiddleware<State>(Store<State> store, action, NextDispatcher next) {
  if (action is CheckThunkAction<State>) {
    action(store);
  } else
    next(action);
}

typedef void CheckThunkAction<State>(Store<State> store);
