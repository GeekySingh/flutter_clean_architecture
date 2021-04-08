import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

void main() {
  /// since main module is dependent on Core module and Feature module,
  /// we need to init these dependent modules here
  Core.init();
  Presentation.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Clean Architecture Sample',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        builder: Core.featureRouteBuilder(Presentation.getFeatureRouter()));
  }
}
