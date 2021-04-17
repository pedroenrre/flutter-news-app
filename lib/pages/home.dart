import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/article_list.dart';
import 'package:news_app/components/article_tile.dart';
import 'package:news_app/components/category_tile.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/pages/Login.dart';
import 'package:news_app/utils/articles.dart';
import 'package:news_app/utils/category_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  Articles articles = new Articles();
  ScrollController _scrollController;
  FirebaseAuth _auth = FirebaseAuth.instance;

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
          actions: [],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("MobNews"),
            ],
          ),
          elevation: 0,
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              _exitApp(context);
            },
            child: const Icon(Icons.logout),
            backgroundColor: Colors.red),
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
                          child: ArticleList(
                              articles: articles,
                              loadingFooter: _loadingFooter,
                              scrollController: _scrollController)),
                      Container(
                        color: Colors.grey[200],
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(10),
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

  Future<bool> _exitApp(BuildContext context) {
    return showDialog(
          builder: (context) => AlertDialog(
            title: Text('Do you want to exit this application?'),
            content: Text('We hate to see you leave...'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  print("you choose no");
                  Navigator.of(context).pop(false);
                },
                child: Text('No'),
              ),
              TextButton(
                onPressed: () async {
                  _auth.signOut().then((value) {
                    Navigator.of(context).pop(false);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  }).onError((error, stackTrace) => null);
                },
                child: Text('Yes'),
              ),
            ],
          ),
          context: context,
        ) ??
        false;
  }
}
