
import 'package:domain/src/common/result.dart';
import 'package:domain/src/model/article_model.dart';

abstract class ArticleRepository {

  Future<Result<List<ArticleModel>>> getArticles();

  Future<Result<ArticleModel>> getArticle(int id);

}