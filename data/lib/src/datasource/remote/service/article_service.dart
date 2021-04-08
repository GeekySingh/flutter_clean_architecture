
import 'package:data/src/common/constants.dart';
import 'package:data/src/datasource/remote/dto/article_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'article_service.g.dart';

@RestApi()
abstract class ArticleService {

  factory ArticleService(Dio dio, {String baseUrl}) = _ArticleService;

  @GET("mostpopular/v2/mostviewed/all-sections/7.json?api-key=${Constants.API_KEY}")
  Future<ArticleResponse> getArticles();

}