import 'package:flutter/material.dart';
import 'package:news_app/components/article_tile.dart';
import 'package:news_app/components/category_tile.dart';
import 'package:news_app/models/article_model.dart';
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
  List<ArticleModel> articles = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = [];
    categories = getCategories();
    articles = [];
    fetchArticles();
  }

  fetchArticles() async {
    Articles articleClass = Articles();
    await articleClass.getArticles();
    articles = articleClass.articles;
    setState(() {
      _loading = false;
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
      body: _loading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
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
                      shrinkWrap: true,
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
                          itemCount: articles.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ArticleTile(
                                imageUrl: articles[index].urlToImage,
                                title: articles[index].title,
                                description: articles[index].description);
                          }),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
