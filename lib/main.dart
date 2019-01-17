import 'package:dmp_flutter/navigation/routes.dart';
import 'package:dmp_flutter/pages/login.dart';
import 'package:dmp_flutter/reducers/reducer.dart';
import 'package:dmp_flutter/states/app_state.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:dmp_flutter/middlewares/thunk.dart';
import 'package:dmp_flutter/middlewares/future.dart';

void main() {
  Routes.init();
  Store<AppState> store = Store<AppState>(PrimaryReducer.reduce,
      initialState: AppState.initialState(),
      middleware: [thunkMiddleware, futureMiddleware]);
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
        home: Login(),
      ),
    );
  }
}
