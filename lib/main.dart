import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  /// since main module is dependent on Core module and Feature module,
  /// we need to init these dependent modules here
  Core.init();
  Presentation.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final _coreRouter = Core.routeBuilder(Presentation.getFeatureRouter());

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Flutter Clean Architecture Sample',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routerDelegate: _coreRouter.delegate(),
        routeInformationParser: _coreRouter.defaultRouteParser());
  }
}
