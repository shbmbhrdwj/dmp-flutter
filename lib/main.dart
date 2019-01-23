import 'package:dmp_flutter/navigation/routes.dart';
import 'package:dmp_flutter/reducers/reducer.dart';
import 'package:dmp_flutter/states/app_state.dart';
import 'package:dmp_flutter/utils/auth.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:dmp_flutter/middlewares/thunk.dart';
import 'package:dmp_flutter/middlewares/future.dart';
import 'package:redux_logging/redux_logging.dart';

void main() async {
  bool isAuthenticated = await Auth.validToken();
  Routes.init(isAuthenticated);
  Store<AppState> store = Store<AppState>(PrimaryReducer.reduce,
      initialState: AppState.initialState(),
      middleware: [
        thunkMiddleware,
        futureMiddleware,
        LoggingMiddleware.printer(
            formatter: LoggingMiddleware.multiLineFormatter)
      ]);

  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'DMP',
        theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            fontFamily: "Poppins",
            primaryColorBrightness: Brightness.dark,
            primaryTextTheme: TextTheme(
                title: TextStyle(color: Colors.white),
                subhead: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.black87))),
        home: Builder(builder: (BuildContext context) {
          return Routes.getRootWidget();
        }),
      ),
    );
  }
}
