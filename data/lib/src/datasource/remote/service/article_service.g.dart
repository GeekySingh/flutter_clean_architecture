// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ArticleService implements ArticleService {
  _ArticleService(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ArticleResponse> getArticles() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        ArticleResponse>(Options(
            method: 'GET', headers: <String, dynamic>{}, extra: _extra)
        .compose(_dio.options,
            'mostpopular/v2/mostviewed/all-sections/7.json?api-key=qtVlLSfH968rf6nd2tqbLPDnHnA7NLEb',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ArticleResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
