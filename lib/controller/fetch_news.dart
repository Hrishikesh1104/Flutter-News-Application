// https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=9bb7bf6152d147ad8ba14cd0e7452f2f
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:pocket_news/model/news_article_model.dart';

class FetchNews {
  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];
  static Future<NewsArticleModel> fetchNews() async {
    final randomSource = Random();
    var randomSourceId = sourcesId[randomSource.nextInt(sourcesId.length)];
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?sources=$randomSourceId&apiKey=46a664ba59b14c2599ad28af1a481ede'));
    Map data = jsonDecode(response.body);
    List articles = data['articles'];
    final randomArticleId = Random();
    var randomArticle = articles[randomArticleId.nextInt(articles.length)];
    return NewsArticleModel.fromJson(randomArticle);
  }
}
