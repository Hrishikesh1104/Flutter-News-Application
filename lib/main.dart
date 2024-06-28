import 'package:flutter/material.dart';
import 'package:pocket_news/view/home.dart';
import 'package:pocket_news/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showSplashScreen = true;
  loadHome() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _showSplashScreen = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadHome();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pocket News',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: _showSplashScreen ? const SplashScreen() : const HomeScreen(),
    );
  }
}
