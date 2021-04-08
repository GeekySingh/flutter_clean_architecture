
class ArticleEntity implements Entity {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final String articleUrl;
  final String date;

  ArticleEntity({this.id, this.title, this.description, this.imageUrl, this.articleUrl, this.date});
}