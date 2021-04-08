
import 'package:data/src/datasource/local/dao/base/base_dao.dart';
import 'package:data/src/datasource/local/entity/article_entity.dart';
import 'package:domain/domain.dart';

class ArticleDao implements BaseDao<ArticleEntity, ArticleModel> {
  @override 
  String get createTableQuery => throw UnimplementedError();

  @override
  List<ArticleEntity> fromList(List<ArticleModel> query) {
    return query.map((e) => e.toEntity())
  }

  @override
  ArticleEntity fromMap(ArticleModel query) {
    // TODO: implement fromMap
    throw UnimplementedError();
  }

  @override
  ArticleModel toMap(ArticleEntity entity) {
    // TODO: implement toMap
    throw UnimplementedError();
  }
  

}