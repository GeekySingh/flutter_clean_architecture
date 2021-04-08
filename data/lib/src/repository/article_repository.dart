
import 'package:data/src/datasource/remote/dto/article_response.dart';
import 'package:data/src/datasource/remote/service/article_service.dart';
import 'package:data/src/mapper/article_mapper.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import 'base/base_repository.dart';

@Injectable(as: ArticleRepository)
class ArticleRepositoryImpl extends BaseRepository implements ArticleRepository {
  final ArticleService _articleService;

  ArticleRepositoryImpl(this._articleService);

  @override
  Future<Result<ArticleModel>> getArticle(int id) async {
    return safeCall(_articleService.getArticles(),
        mapper: (ArticleResponse response) => response.articles
            .map((e) => e.toModel())
            .toList()
            .firstWhere((element) => element.id == id));
  }

  @override
  Future<Result<List<ArticleModel>>> getArticles() {
    return safeCall(_articleService.getArticles(),
        mapper: (ArticleResponse response) =>
            response.articles.map((e) => e.toModel()).toList());
  }
}
