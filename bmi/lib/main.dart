import 'package:flutter/material.dart';
import 'package:bmi/InputPage.dart';

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

      home: InputPage(),
    );
  }
}

