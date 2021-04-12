import 'package:flutter/material.dart';
import 'package:news_app/components/article_tile.dart';
import 'package:news_app/components/category_tile.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/utils/articles.dart';
import 'package:news_app/utils/category_data.dart';

// 5a184881ccc849828d579f683ffce622

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        setState(() {
          _loadingFooter = true;
        });
        fetchArticles();
      }
    });

    super.initState();

    categories = [];
    categories = getCategories();
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
    await articles.getArticles();
    setState(() {
      _loading = false;
      _loadingFooter = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Mob"),
              Text(
                "News",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
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
                      Container(
                        color: Colors.grey[50],
                        height: 80,
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: ListView.builder(
                          itemCount: categories.length,
                          // shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryTile(category: categories[index]);
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.grey[200],
                          child: ListView.builder(
                              controller: _scrollController,
                              itemCount: articles.articles.length,
                              // shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ArticleTile(
                                    imageUrl:
                                        articles.articles[index].urlToImage,
                                    title: articles.articles[index].title,
                                    description:
                                        articles.articles[index].description);
                              }),
                        ),
                      ),
                      _loadingFooter
                          ? Container(
                              color: Colors.grey[200],
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator()),
                                ),
                              ),
                            )
                          : SizedBox(height: 0),
                    ],
                  ),
                ),
        ));
  }
}
