import 'package:NewsApp/screens/full_article_screen.dart';
import 'package:NewsApp/slider_animation.dart';
import 'package:flutter/material.dart';
import 'package:NewsApp/models/news_model.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen(this.data, {Key? key}) : super(key: key);
  final NewsData data;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Use a Stack to overlay the image and author name
                Stack(
                  children: [
                    // Image with 1/3 screen height
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: double.infinity,
                      child: Hero(
                        tag: "${widget.data.title}",
                        child: Image.network(
                          widget.data.urlToImage!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Author name displayed over the image
                    Positioned(
                      bottom: 20.0,
                      right: 20.0,
                      child: Text(
                        widget.data.author ?? '', // Author name here
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                // Rest of the content below the image
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data.title!,
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        widget.data.content ?? '', // Content here
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    SlidePageRouteRL(
                      builder: (context) =>
                          FullArticleWebView(url: widget.data.url ?? ''),
                    ),
                  );
                },
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.blue,
                ),
                backgroundColor:
                    Colors.white, // Customize the button color as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
