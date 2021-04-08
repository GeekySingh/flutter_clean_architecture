// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../features/articles/details/article_detail_screen.dart';
import '../features/articles/list/article_list_screen.dart';
import '../features/login/login_screen.dart';

class Routes {
  static const String loginScreen = '/';
  static const String articleListScreen = '/article-list-screen';
  static const String articleDetailScreen = '/article-detail-screen';
  static const all = <String>{
    loginScreen,
    articleListScreen,
    articleDetailScreen,
  };
}

class FeatureRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.articleListScreen, page: ArticleListScreen),
    RouteDef(Routes.articleDetailScreen, page: ArticleDetailScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    LoginScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginScreen(),
        settings: data,
      );
    },
    ArticleListScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ArticleListScreen(),
        settings: data,
      );
    },
    ArticleDetailScreen: (data) {
      final args = data.getArgs<ArticleDetailScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ArticleDetailScreen(args.id),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ArticleDetailScreen arguments holder class
class ArticleDetailScreenArguments {
  final int id;
  ArticleDetailScreenArguments({@required this.id});
}
