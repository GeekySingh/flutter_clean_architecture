import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SnackbarService {

  final StackRouter _router;
  SnackbarService(this._router);

  BuildContext _getSafeContext() {
    final context = _router.navigatorKey.currentContext;
    return context != null
        ? context
        : throw ('Have you forgot to setup routes?');
  }

  void show(String message, {SnackBarAction? action}) {
    final snackBar = SnackBar(content: Text(message), action: action);
    ScaffoldMessenger.of(_getSafeContext()).showSnackBar(snackBar);
  }
}
