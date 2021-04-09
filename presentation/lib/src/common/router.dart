import 'package:auto_route/annotations.dart';

import '../features/articles/details/article_detail_screen.dart';
import '../features/articles/list/article_list_screen.dart';
import '../features/login/login_screen.dart';

export 'router.gr.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: LoginScreen, initial: true),
  AutoRoute(page: ArticleListScreen),
  AutoRoute(page: ArticleDetailScreen)
])
class $FeatureRouter {}
