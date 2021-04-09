import 'package:auto_route/auto_route.dart';
import 'package:core/src/di/locator.dart';

class Core {
  static void init() {
    /// setup required locators for core module
    setupLocator();
  }

  static RootStackRouter routeBuilder(RootStackRouter router) {
    locator.registerLazySingleton<StackRouter>(() => router);
    return router;
  }
}
