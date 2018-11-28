import 'package:dmp_flutter/pages/customer/home.dart';
import 'package:dmp_flutter/pages/login.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Routes {
  static String root = "/";
  static String login = "/login";
  static String customerHome = "/customer/home";

  static Router router;

  static void init() {
    router = Router();

    var loginHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Login();
    });

    var customerHomeHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Home();
    });


    //TODO Check user authenticated
    // If user is logged in
    // rootHandler = customerHomeHandler
    // else rootHandler = loginHandler


    var rootHandler = loginHandler;

    router.define(root, handler: rootHandler);
    router.define(login, handler: loginHandler);
    router.define(customerHome, handler: customerHomeHandler);
  }
}
