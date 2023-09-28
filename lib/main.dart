import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_hub/screens/splash_page.dart';

void main() {
  runApp(const ProviderScope(
      child: MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FruitHubApp(),
  )));
}

class FruitHubApp extends StatelessWidget {
  const FruitHubApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const SplashPage();
  }
}
