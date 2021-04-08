
import 'package:core/core/core_view_model.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../common/router.gr.dart';

@injectable
class ArticleListViewModel extends CoreViewModel {

  final GetAllArticleUseCase _allArticleUseCase;

  ArticleListViewModel(this._allArticleUseCase) {
    loadArticles();
  }

  List<ArticleModel> _articleList;
  List<ArticleModel> get articleList => _articleList;

  String _errorMsg;
  String get errorMsg => _errorMsg;

  void loadArticles() async {
    loading();

    final result = await _allArticleUseCase.getArticles();
    result.when(
      success: (data) => _articleList = data,
      error: (errorType, message) => _errorMsg = message,
    );

    loaded(result.isSuccessful);
  }

  void onArticleItemClicked(int id) {
    navigationService.push(Routes.articleDetailScreen, ArticleDetailScreenArguments(id: id));
  }
}