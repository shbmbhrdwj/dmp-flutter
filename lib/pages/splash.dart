import 'package:dmp_flutter/config/ApiClient.dart';
import 'package:dmp_flutter/navigation/routes.dart';
import 'package:dmp_flutter/utils/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _checkUserLoggedIn(context);

    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset("assets/graphics/flutter-icon.svg",
                color: Colors.lightBlue),
          ],
        ),
      ),
    ));
  }
  //

  void _checkUserLoggedIn(BuildContext context) async {
    await Auth.init();
    Auth.validToken().then((isValid) {
      if (!isValid)
        Routes.router
            .navigateTo(context, Routes.login, replace: true, clearStack: true);
      else
        Routes.router.navigateTo(context, Routes.customerHome,
            replace: true, clearStack: true);
    });
  }
}
