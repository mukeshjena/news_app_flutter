import 'package:flutter/material.dart';

import 'atricle_model.dart';
import 'homepage.dart';
import 'news.dart';

class CatagoryNews extends StatefulWidget {
  final String catagory;
  CatagoryNews({required this.catagory});
  @override
  State<CatagoryNews> createState() => _CatagoryNewsState();
}

class _CatagoryNewsState extends State<CatagoryNews> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsForCategorie();
  }

  getNewsForCategorie() async {
    NewsForCategorie newsClass = NewsForCategorie();
    await newsClass.getNewsForCategory(widget.catagory);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kalam'),
            ),
            Text(
              'App',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kalam'),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.add)),
          )
        ],
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return BlogTile(
                          imageUrl: articles[index].urlToImage,
                          title: articles[index].title,
                          url: articles[index].url,
                          desc: articles[index].content);
                    }),
              ),
            ),
    );
  }
}
