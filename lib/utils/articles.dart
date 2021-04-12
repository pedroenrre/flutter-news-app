import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class Articles {
  List<ArticleModel> articles = [];

  Future<void> getArticles() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=br&category=business&apiKey=5a184881ccc849828d579f683ffce622";

    try {
      final response = await Dio().get(url);

      if (response.data['status'] == 'ok') {
        response.data['articles'].forEach((e) {
          if (e['urlToImage'] != null && e['description'] != null) {
            ArticleModel articleModel = ArticleModel.fromJson(e);
            articles.add(articleModel);
          }
        });
      }
    } catch (e) {}
  }
}
