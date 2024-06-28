import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocket_news/view/detail_view.dart';

class NewsContainer extends StatelessWidget {
  String imageUrl;
  String newsHeading;
  String newsDescription;
  String newsUrl;
  String newsContent;
  String sourcedFrom;
  String publishedAt;
  NewsContainer({
    super.key,
    required this.imageUrl,
    required this.newsDescription,
    required this.newsContent,
    required this.newsHeading,
    required this.newsUrl,
    required this.sourcedFrom,
    required this.publishedAt,
  });

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat.yMMMMd().format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // FadeInImage.assetNetwork(
        //     height: 400,
        //     width: MediaQuery.of(context).size.width,
        //     fit: BoxFit.cover,
        //     placeholder: "assets/megaphone.png",
        //     image: imageUrl),
        Image.network(
          height: 400,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          !imageUrl.contains('http')
              ? 'https://static9.depositphotos.com/1011646/1236/i/450/depositphotos_12369509-stock-photo-breaking-news-screen.jpg'
              : imageUrl,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 15,
            ),
            Text(
              newsHeading.length > 80
                  ? "${newsHeading.substring(0, 80)}..."
                  : newsHeading,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              newsDescription.length > 120
                  ? "${newsDescription.substring(0, 120)}..."
                  : newsDescription,
              style: TextStyle(fontSize: 12, color: Colors.black87),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Source: $sourcedFrom\nPublished on: ${formatDate(publishedAt)}',
              style: TextStyle(fontSize: 12, color: Colors.black38),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              newsContent != ""
                  ? newsContent.length > 250
                      ? newsContent.substring(0, 250)
                      : "${newsContent.toString().substring(0, newsContent.length - 15)}..."
                  : 'Press read more to get detailed news',
              style: TextStyle(fontSize: 16),
            ),
          ]),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailView(newsUrl: newsUrl)));
                },
                child: Text(
                  "Read More",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
