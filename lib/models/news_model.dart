//while the app is building let's create the NewsData class

class NewsData {
  String? title;
  String? author;
  String? content;
  String? urlToImage;
  String? date;
  String? url;

  //let's create the constructor
  NewsData(
      {this.title,
      this.author,
      this.content,
      this.date,
      this.urlToImage,
      this.url});
}
