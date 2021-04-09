
import 'package:core/core/core_view_model.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/src/common/router.dart';

@injectable
class ArticleListViewModel extends CoreViewModel {

  final GetAllArticleUseCase _allArticleUseCase;

  ArticleListViewModel(this._allArticleUseCase) {
    loadArticles();
  }

  late List<ArticleModel> _articleList;
  List<ArticleModel> get articleList => _articleList;

  late String _errorMsg;
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
    navigationService.push(ArticleDetailScreenRoute(id: id));
  }
}