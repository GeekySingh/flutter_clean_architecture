// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleResponse _$ArticleResponseFromJson(Map<String, dynamic> json) {
  return ArticleResponse(
    (json['results'] as List<dynamic>)
        .map((e) => Article.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ArticleResponseToJson(ArticleResponse instance) =>
    <String, dynamic>{
      'results': instance.articles,
    };

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
    json['id'] as int,
    (json['media'] as List<dynamic>)
        .map((e) => Media.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['published_date'] as String,
    json['title'] as String,
    json['abstract'] as String,
    json['updated'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'media': instance.media,
      'published_date': instance.publishedDate,
      'title': instance.title,
      'abstract': instance.abstract,
      'updated': instance.updated,
      'url': instance.url,
    };

Media _$MediaFromJson(Map<String, dynamic> json) {
  return Media(
    (json['media-metadata'] as List<dynamic>?)
        ?.map((e) => MediaMetaData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'media-metadata': instance.mediaMetadata,
    };

MediaMetaData _$MediaMetaDataFromJson(Map<String, dynamic> json) {
  return MediaMetaData(
    json['url'] as String,
  );
}

Map<String, dynamic> _$MediaMetaDataToJson(MediaMetaData instance) =>
    <String, dynamic>{
      'url': instance.url,
    };
