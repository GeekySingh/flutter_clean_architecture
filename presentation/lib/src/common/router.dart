import 'package:auto_route/auto_route_annotations.dart';

import '../features/articles/details/article_detail_screen.dart';
import '../features/articles/list/article_list_screen.dart';
import '../features/login/login_screen.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: LoginScreen, initial: true),
  MaterialRoute(page: ArticleListScreen),
  MaterialRoute(page: ArticleDetailScreen)
])
class $FeatureRouter {}
