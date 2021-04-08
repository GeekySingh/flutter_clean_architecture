

import 'package:json_annotation/json_annotation.dart';

part 'article_response.g.dart';

@JsonSerializable()
class ArticleResponse {

  @JsonKey(name: 'results')
  final List<Article> articles;

  ArticleResponse(this.articles);

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleResponseToJson(this);
}

@JsonSerializable()
class Article {
  final int id;
  final List<Media> media;
  @JsonKey(name: 'published_date')
  final String publishedDate;
  final String title;
  final String abstract;
  final String updated;
  final String url;

  Article(this.id, this.media, this.publishedDate, this.title, this.abstract,
      this.updated, this.url);

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

}

@JsonSerializable()
class Media {
  @JsonKey(name: 'media-metadata')
  final List<MediaMetaData> mediaMetadata;

  Media(this.mediaMetadata);

  factory Media.fromJson(Map<String, dynamic> json) =>
      _$MediaFromJson(json);

  Map<String, dynamic> toJson() => _$MediaToJson(this);
}

@JsonSerializable()
class MediaMetaData {
  final String url;

  MediaMetaData(this.url);

  factory MediaMetaData.fromJson(Map<String, dynamic> json) =>
      _$MediaMetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$MediaMetaDataToJson(this);
}