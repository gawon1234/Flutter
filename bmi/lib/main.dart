import 'package:bmi/results_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi/InputPage.dart';
import 'results_page.dart';

void main() {
  runApp(BMICal());
}

class BMICal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.black,
          textTheme: TextTheme(body1: TextStyle(color: Colors.yellow))),

      //home: InputPage(),
      initialRoute: '/',
      routes: {
        '/' : (context) => InputPage(),
        '/result_page' : (context) => ResultsPage()
      },
    );
  }
}

