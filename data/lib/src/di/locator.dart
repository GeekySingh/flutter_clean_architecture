
import 'package:data/src/common/constants.dart';
import 'package:data/src/datasource/remote/service/article_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'locator.config.dart';

final locator = GetIt.instance;

@injectableInit
void setupLocator() {
  _init(locator);
  $initGetIt(locator);
}

void _init(GetIt locator) {

  _registerNetworkModules(locator);
  _registerServices(locator);
}

void _registerNetworkModules(GetIt locator) {

  locator.registerFactory<Dio>(() => Dio());
}

void _registerServices(GetIt locator) {

  locator.registerFactory<ArticleService>(() => ArticleService(locator(), baseUrl: Constants.BASE_URL));
}