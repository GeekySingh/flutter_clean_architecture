import 'package:auto_route/auto_route.dart';
import 'package:core/service/navigation_service.dart';
import 'package:core/src/di/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Core {
  static void init() {
    /// setup required locators for core module
    setupLocator();
  }

  static TransitionBuilder featureRouteBuilder<T extends RouterBase>(T router) {
    return ExtendedNavigator<T>(
        router: router,
        navigatorKey: locator<NavigationService>().navigatorKey);
  }
}
