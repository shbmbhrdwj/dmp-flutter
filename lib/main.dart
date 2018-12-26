import 'package:dmp_flutter/navigation/routes.dart';
import 'package:dmp_flutter/pages/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Routes.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DMP',
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          fontFamily: "Poppins",
          primaryColorBrightness: Brightness.dark,
          primaryTextTheme: TextTheme(
            title: TextStyle(color: Colors.white),
            subhead: TextStyle(fontWeight: FontWeight.w700, fontSize: 18,color: Colors.black87)
          )),
      home: Splash(),
    );
  }
}
