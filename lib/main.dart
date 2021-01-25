import 'package:flutter/material.dart';
import 'IntroScreen.dart';
import 'MyHomePage.dart';
import 'ResultScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        IntroScreen.id: (context) => IntroScreen(),
        MyHomePage.id: (context) => MyHomePage(),
        ResultScreen.id: (context) => ResultScreen(),
      },
      home: IntroScreen(),
    );
  }
}


