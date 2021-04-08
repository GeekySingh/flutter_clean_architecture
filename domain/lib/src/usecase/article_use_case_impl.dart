
import 'package:domain/src/common/result.dart';
import 'package:domain/src/model/article_model.dart';
import 'package:domain/src/repository/article_repository.dart';
import 'package:injectable/injectable.dart';

import '../../domain.dart';

@Injectable(as: GetAllArticleUseCase)
/// implementation of use cases
class GetAllArticleUseCaseImpl extends GetAllArticleUseCase {
  final ArticleRepository _repository;

  GetAllArticleUseCaseImpl(this._repository);

  @override
  Future<Result<List<ArticleModel>>> getArticles() => _repository.getArticles();
}

@Injectable(as: GetArticleByIdUseCase)
/// implementation of use cases
class GetArticleByIdUseCaseImpl extends GetArticleByIdUseCase {
  final ArticleRepository _repository;

  GetArticleByIdUseCaseImpl(this._repository);

  @override
  Future<Result<ArticleModel>> getArticle(int id) => _repository.getArticle(id);
}
