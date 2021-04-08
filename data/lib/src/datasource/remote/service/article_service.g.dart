// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ArticleService implements ArticleService {
  _ArticleService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<ArticleResponse> getArticles() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'mostpopular/v2/mostviewed/all-sections/7.json?api-key=qtVlLSfH968rf6nd2tqbLPDnHnA7NLEb',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ArticleResponse.fromJson(_result.data);
    return value;
  }
}
