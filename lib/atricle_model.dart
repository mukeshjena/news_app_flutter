class ArticleModel {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;

  ArticleModel(
      {required this.title,
      required this.description,
      required this.author,
      required this.content,
      required this.urlToImage,
      required this.url});
}
