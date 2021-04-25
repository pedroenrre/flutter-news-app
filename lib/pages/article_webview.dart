import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatefulWidget {
  final String articleUrl;
  ArticleWebView({this.articleUrl});

  @override
  _ArticleWebViewState createState() => _ArticleWebViewState();
}

class _ArticleWebViewState extends State<ArticleWebView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  double progress = 0;
  String url;

  @override
  void initState() {
    super.initState();
    url = widget.articleUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text("MobNews"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
              height: 60,
              padding: EdgeInsets.all(10.0),
              color: Colors.grey[200],
              alignment: Alignment.centerLeft,
              child: Text(
                url,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
              // "${(widget.articleUrl.length > 50) ? widget.articleUrl.substring(0, 50) + "..." : widget.articleUrl}"),
              ),
          Container(
              child: progress < 1.0
                  ? LinearProgressIndicator(value: progress)
                  : Container()),
          Expanded(
            child: Container(
              child: WebView(
                gestureNavigationEnabled: true,
                initialUrl: widget.articleUrl,
                onWebViewCreated: ((WebViewController webViewController) {
                  _completer.complete(webViewController);
                }),
                onProgress: (int progress) {
                  setState(() {
                    this.progress = progress / 100;
                  });
                },
                onPageStarted: (newurl) {
                  setState(() {
                    this.url = newurl;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
