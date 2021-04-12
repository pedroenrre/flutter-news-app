import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class Articles {
  String status;
  int totalResults;
  final int pageSize = 5;
  int page = 1;
  List<ArticleModel> articles;

  Articles({this.status, this.totalResults, this.articles});

  Articles.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        if (v['urlToImage'] != null && v['description'] != null) {
          articles.add(new ArticleModel.fromJson(v));
        }
      });
    }
  }

  Future<void> getArticles() async {
    print(totalResults);
    if (totalResults != null) {
      print('1 if');
      if ((totalResults / pageSize).ceil() <= page) {
        print((totalResults / pageSize).ceil().toString());
        print(((page - 1) * pageSize).toString());
        return;
      }
    }
    print('passou');

    String url =
        "https://newsapi.org/v2/top-headlines?country=br&pageSize=$pageSize&page=$page&category=&apiKey=5a184881ccc849828d579f683ffce622";

    try {
      Dio dio = new Dio();
      final response = await dio.get(url);

      if (response.data['status'] == 'ok') {
        Articles tmp = Articles.fromJson(response.data);
        this.status = tmp.status;
        this.totalResults = tmp.totalResults;
        this.articles.addAll(tmp.articles);
        page++;
      }
    } catch (e) {}
  }
}
