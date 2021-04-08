
import 'package:data/src/common/constants.dart';
import 'package:data/src/datasource/local/dao/article_dao.dart';
import 'package:data/src/datasource/local/db/app_database.dart';
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
  _registerDatabase(locator);
}

void _registerNetworkModules(GetIt locator) {

  locator.registerLazySingleton<Dio>(() => Dio());
}

void _registerServices(GetIt locator) {

  locator.registerLazySingleton<ArticleService>(() => ArticleService(locator(), baseUrl: Constants.BASE_URL));
}

void _registerDatabase(GetIt locator) {
  locator.registerLazySingletonAsync<AppDatabase>(() => $FloorAppDatabase.databaseBuilder("name").build());

  locator.registerLazySingleton<ArticleDao>(() => locator<AppDatabase>().articleDao);
}