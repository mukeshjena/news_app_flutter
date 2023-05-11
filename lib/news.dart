import 'dart:convert';

import 'api_key.dart';
import 'atricle_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=${apiKey}";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["content"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            author: element["author"],
            url: element["url"],
            content: element["content"],
            urlToImage: element["urlToImage"],
            description: element["description"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class NewsForCategorie {
  List<ArticleModel> news = [];

  Future<void> getNewsForCategory(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=${apiKey}";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            author: element["author"],
            url: element["url"],
            content: element["content"],
            urlToImage: element["urlToImage"],
            description: element["description"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
