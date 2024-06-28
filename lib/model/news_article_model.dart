class NewsArticleModel {
  String imageUrl;
  String newsHeading;
  String newsDescription;
  String newsContent;
  String newsUrl;
  String publishedAt;
  String sourcedFrom;

  NewsArticleModel({
    required this.imageUrl,
    required this.newsHeading,
    required this.newsDescription,
    required this.newsContent,
    required this.newsUrl,
    required this.publishedAt,
    required this.sourcedFrom,
  });

  static NewsArticleModel fromJson(Map<String, dynamic> article) {
    return NewsArticleModel(
      imageUrl: article["urlToImage"] ?? "",
      newsHeading: article["title"] ?? "",
      newsDescription: article["description"] ?? "",
      newsContent: article["content"] ?? "",
      newsUrl: article["url"] ??
          "https://news.google.com/topstories?hl=en-IN&gl=IN&ceid=IN:en",
      publishedAt: article["publishedAt"] ?? 'google',
      sourcedFrom: article["source"]["name"] ?? 'recently',
    );
  }
}
