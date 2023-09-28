import 'package:NewsApp/api_key.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:NewsApp/models/news_model.dart';
import 'package:NewsApp/components/breaking_news_card.dart';
import 'package:NewsApp/components/news_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Map<String, List<NewsData>>> _newsDataFuture;

  @override
  void initState() {
    super.initState();
    _newsDataFuture = _fetchNewsData();
  }

  Future<Map<String, List<NewsData>>> _fetchNewsData() async {
    final apiUrlBreaking =
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey';
    final apiUrlRecent =
        'https://newsapi.org/v2/everything?q=recent&apiKey=$apiKey';

    final responseBreaking = await http.get(Uri.parse(apiUrlBreaking));
    final responseRecent = await http.get(Uri.parse(apiUrlRecent));

    if (responseBreaking.statusCode == 200 &&
        responseRecent.statusCode == 200) {
      final Map<String, dynamic> dataBreaking =
          json.decode(responseBreaking.body);
      final Map<String, dynamic> dataRecent = json.decode(responseRecent.body);

      final List<dynamic> articlesBreaking = dataBreaking['articles'];
      final List<dynamic> articlesRecent = dataRecent['articles'];

      List<NewsData> breakingNewsDataList = articlesBreaking.map((article) {
        String? imageUrl = article['urlToImage'];
        if (imageUrl == null || imageUrl.isEmpty) {
          imageUrl =
              'https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg';
        }

        return NewsData(
          title: article['title'],
          author: article['author'],
          content: article['content'],
          date: article['publishedAt'],
          urlToImage: imageUrl,
          url: article['url'],
        );
      }).toList();

      List<NewsData> recentNewsDataList = articlesRecent.map((article) {
        String? imageUrl = article['urlToImage'];
        if (imageUrl == null || imageUrl.isEmpty) {
          imageUrl =
              'https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg';
        }

        return NewsData(
          title: article['title'],
          author: article['author'],
          content: article['content'],
          date: article['publishedAt'],
          urlToImage: imageUrl,
          url: article['url'],
        );
      }).toList();

      return {
        'breakingNews': breakingNewsDataList,
        'recentNews': recentNewsDataList,
      };
    } else {
      throw Exception('Failed to load news data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F6F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Breaking News",
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FutureBuilder<Map<String, List<NewsData>>>(
                  future: _newsDataFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final data = snapshot.data ?? {};

                      final breakingNewsData = data['breakingNews'] ?? [];

                      return CarouselSlider.builder(
                        itemCount: breakingNewsData.length,
                        itemBuilder: (context, index, id) {
                          final newsData = breakingNewsData[index];
                          final imageUrl = newsData.urlToImage;

                          return imageUrl != null && imageUrl.isNotEmpty
                              ? BreakingNewsCard(newsData)
                              : SizedBox();
                        },
                        options: CarouselOptions(
                          aspectRatio: 16 / 9,
                          enableInfiniteScroll: false,
                          enlargeCenterPage: true,
                        ),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  "Recent News",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                FutureBuilder<Map<String, List<NewsData>>>(
                  future: _newsDataFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final data = snapshot.data ?? {};

                      final recentNewsData = data['recentNews'] ?? [];

                      return Column(
                        children:
                            recentNewsData.map((e) => NewsListTile(e)).toList(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
