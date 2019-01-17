import 'package:redux/redux.dart';

const suffixes = ['LOADING', 'SUCCESS', 'FAILED'];

abstract class FutureAction {
  Future<dynamic> future;
  getPendingAction();
  getSuccessAction();
  getFailedAction();
}

class FutureSuccessAction<T> {
  T result;

  FutureSuccessAction();
}

class FutureFailedAction<E> {
  E error;

  FutureFailedAction();
}

futureMiddleware(Store store, action, NextDispatcher next) {
  if (action is FutureAction) {
    var payload = action.future;
    store.dispatch(action.getPendingAction());
    _dispatchResults(store, payload, action);
  } else {
    next(action);
  }
}

Future<dynamic> _dispatchResults(
    Store store, Future<dynamic> future, FutureAction action) {
  return future.then((result) {
    final fulfilledAction = action.getSuccessAction();
    fulfilledAction.result = result;
    store.dispatch(fulfilledAction);
    return fulfilledAction;
  }).catchError((error) {
    final errorAction = action.getFailedAction();
    errorAction.error = error;
    store.dispatch(errorAction);
    return errorAction;
  });
}
