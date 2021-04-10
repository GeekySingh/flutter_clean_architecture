import 'package:core/core/core_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/src/common/constants/app_strings.dart';

import '../../di/locator.dart';
import 'login_view_model.dart';

class LoginScreen extends CoreScreen<LoginViewModel> {
  @override
  Widget builder(BuildContext context, LoginViewModel viewModel, Widget? child) {
    return Scaffold(
        appBar: AppBar(title: Text(AppStrings.login)),
        body: _buildBody(context, viewModel));
  }

  Widget _buildBody(BuildContext context, LoginViewModel viewModel) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
              decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: AppStrings.userName,
          )),
          SizedBox(height: 20),
          TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: AppStrings.password,
              )),
          SizedBox(height: 20),
          RaisedButton(
              child: Text(AppStrings.login),
              onPressed: () => viewModel.onLoginButtonPressed())
        ]));
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) =>
      locator<LoginViewModel>();
}
