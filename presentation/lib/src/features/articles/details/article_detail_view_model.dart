import 'package:core/core/core_view_model.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ArticleDetailViewModel extends CoreViewModel {

  final GetArticleByIdUseCase _articleByIdUseCase;

  ArticleDetailViewModel(this._articleByIdUseCase);

  late String _errorMsg;
  String get errorMsg => _errorMsg;

  late ArticleModel _articleModel;
  ArticleModel get articleModel => _articleModel;

  void getArticleDetails(int id) async {
    loading();

    final result = await _articleByIdUseCase.getArticle(id);
    result.when(
        success: (article) => _articleModel = article,
        error: (type, message) => _errorMsg = message);

    loaded(result.isSuccessful);
  }
}
