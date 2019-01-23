import 'package:dmp_flutter/pages/categories.dart';
import 'package:dmp_flutter/pages/customer/home.dart';
import 'package:dmp_flutter/pages/customer/provider_list.dart';
import 'package:dmp_flutter/pages/login.dart';
import 'package:dmp_flutter/pages/provider/profile.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class Routes {
  static String root = "/";
  static String login = "/login";
  static String categories = "/categories";
  static String customerHome = "/customer/home";
  static String providerList = "/customer/category/:categoryId/providers";
  static String providerProfile = "/customer/provider/:providerId/profile";

  static Router router;

  static bool _isAuthenticated = false;

  static void init(bool isAuthenticated) {
    router = Router();
    _isAuthenticated = isAuthenticated;
    var loginHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Login();
    });

    var customerHomeHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Home();
    });

    var categoriesHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Categories();
    });

    var providerListHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return ProviderList(
        categoryId: params["categoryId"][0],
      );
    });

    var providerProfileHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return ProviderProfile(
        providerId: params["providerId"][0],
      );
    });

    Handler rootHandler = loginHandler;

    if (_isAuthenticated) rootHandler = customerHomeHandler;

    router.define(root, handler: rootHandler);
    router.define(login, handler: loginHandler);
    router.define(customerHome, handler: customerHomeHandler);
    router.define(categories, handler: categoriesHandler);
    router.define(providerList, handler: providerListHandler);
    router.define(providerProfile, handler: providerProfileHandler);
  }

  static Widget getRootWidget() {
    if (_isAuthenticated) {
      return Home();
    }
    return Login();
  }

  static String getRoute(String route, Map<String, String> params) {
    return route.replaceAllMapped(RegExp("(:[a-zA-Z]+)"), (match) {
      if (match.groupCount > 0) {
        String paramName = match.group(0).substring(1);
        return params[paramName];
      }
    });
  }
}
