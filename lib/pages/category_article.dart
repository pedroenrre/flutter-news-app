import 'package:flutter/material.dart';
import 'package:news_app/components/article_list.dart';
import 'package:news_app/components/category_tile.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/utils/articles.dart';

class CategoryArticle extends StatefulWidget {
  final String category;
  CategoryArticle({@required this.category});
  @override
  _CategoryArticleState createState() => _CategoryArticleState();
}

class _CategoryArticleState extends State<CategoryArticle> {
  List<CategoryModel> categories = [];
  Articles articles = new Articles();
  ScrollController _scrollController;

  bool _loading = true;
  bool _loadingFooter = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        if (articles.articles.length < articles.totalResults &&
            !_loadingFooter) {
          setState(() {
            _loadingFooter = true;
          });
          fetchArticles();
        }
      }
    });

    super.initState();

    articles.articles = [];
    fetchArticles();

    // Adding listerner for fetch data on the end of the array
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  fetchArticles() async {
    await articles.getArticles(cat: widget.category);
    setState(() {
      _loading = false;
      _loadingFooter = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [],
          title: Text(widget.category),
          elevation: 0,
          centerTitle: true,
        ),
        body: SafeArea(
          child: _loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          child: ArticleList(
                              articles: articles,
                              loadingFooter: _loadingFooter,
                              scrollController: _scrollController)),
                      Container(
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: _loadingFooter
                                ? SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator())
                                : null,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        ));
  }
}
