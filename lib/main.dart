import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calculator_practice/titlescreen_page.dart';

import 'calculator_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Calculator Practice',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: TitleScreenPage(),
    );
  }
}