import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class FullArticleWebView extends StatefulWidget {
  final String url;

  FullArticleWebView({required this.url});

  @override
  _FullArticleWebViewState createState() => _FullArticleWebViewState();
}

class _FullArticleWebViewState extends State<FullArticleWebView> {
  bool _isLoading = true;
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    print("Full Article URL: ${widget.url}");
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            if (!_hasError)
              InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    javaScriptEnabled: true,
                  ),
                ),
                onLoadStart: (controller, url) {
                  setState(() {
                    _isLoading = true;
                    _hasError = false;
                  });
                },
                onLoadStop: (controller, url) {
                  setState(() {
                    _isLoading = false;
                  });
                },
                onLoadError: (controller, url, code, message) {
                  setState(() {
                    _isLoading = false;
                    _hasError = true;
                  });
                  print(
                      'Error loading URL: $url, Code: $code, Message: $message');
                },
              ),
            if (_isLoading)
              Center(
                child: CircularProgressIndicator(),
              ),
            if (_hasError)
              Center(
                child: Text(
                  'Failed to load the content.',
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
