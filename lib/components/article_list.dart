import 'package:flutter/material.dart';
import 'package:news_app/components/article_tile.dart';
import 'package:news_app/components/category_tile.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/utils/articles.dart';

class ArticleList extends StatelessWidget {
  final Articles articles;
  final bool loadingFooter;
  final ScrollController scrollController;
  final VoidCallback onEndReache;

  ArticleList(
      {@required this.articles,
      @required this.loadingFooter,
      @required this.scrollController,
      this.onEndReache});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Padding(
        padding: EdgeInsets.only(bottom: loadingFooter ? 0 : 20),
        child: ListView.builder(
            controller: scrollController,
            itemCount: articles.articles.length,
            // shrinkWrap: true,
            itemBuilder: (context, index) {
              return ArticleTile(
                  imageUrl: articles.articles[index].urlToImage,
                  title: articles.articles[index].title,
                  description: articles.articles[index].description);
            }),
      ),
    );
  }
}
