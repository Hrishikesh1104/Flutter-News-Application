import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailView extends StatelessWidget {
  final String newsUrl;

  const DetailView({
    super.key,
    required this.newsUrl,
  });

  @override
  Widget build(BuildContext context) {
    final modifiedUrl = newsUrl.contains("http:")
        ? newsUrl.replaceAll("http:", "https:")
        : newsUrl;

    final controller = WebViewController();

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(modifiedUrl));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pocket',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              'News',
              style: TextStyle(fontWeight: FontWeight.w500, color: Colors.blue),
            ),
          ],
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
