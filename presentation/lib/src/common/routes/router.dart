import 'package:auto_route/annotations.dart';
import 'package:presentation/src/features/articles/details/article_detail_screen.dart';
import 'package:presentation/src/features/articles/list/article_list_screen.dart';
import 'package:presentation/src/features/login/login_screen.dart';

export 'router.gr.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: LoginScreen, initial: true),
  AutoRoute(page: ArticleListScreen),
  AutoRoute(page: ArticleDetailScreen)
])
class $FeatureRouter {}
