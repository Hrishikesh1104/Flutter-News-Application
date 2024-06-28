import 'package:flutter/material.dart';
import 'package:pocket_news/controller/fetch_news.dart';
import 'package:pocket_news/model/news_article_model.dart';
import 'package:pocket_news/view/widgets/news_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NewsArticleModel newsArticle;
  bool isLoading = true;

  getNews() async {
    newsArticle = await FetchNews.fetchNews();
    setState(() {
      newsArticle;
      isLoading = false;
    });
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pocket',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              'News',
              style: TextStyle(fontWeight: FontWeight.w500, color: Colors.blue),
            )
          ],
        ),
      ),
      body: PageView.builder(
        controller: PageController(initialPage: 0),
        scrollDirection: Axis.vertical,
        onPageChanged: (value) {
          setState(() {
            isLoading = false;
          });
          getNews();
        },
        itemBuilder: (context, index) {
          return isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                )
              : NewsContainer(
                  imageUrl: newsArticle.imageUrl,
                  newsHeading: newsArticle.newsHeading,
                  newsDescription: newsArticle.newsDescription,
                  newsUrl: newsArticle.newsUrl,
                  newsContent: newsArticle.newsContent,
                  sourcedFrom: newsArticle.sourcedFrom,
                  publishedAt: newsArticle.publishedAt,
                );
        },
      ),
    );
  }
}
