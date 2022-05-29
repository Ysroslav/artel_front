import 'package:flutter/material.dart';
import 'package:web_artel/pages/home_page.dart';
import 'package:web_artel/pages/pricing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Artel',
      theme: ThemeData(
        backgroundColor: Colors.white
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const Home(),
        '/pricing' : (context) => const Pricing(),
      },
    );
  }

}
