import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Template"),
          backgroundColor: Colors.pink[400],
          // actions: [
          //   Icon(Icons.account_box),
          //   Icon(Icons.anchor),
          //   Icon(Icons.add_a_photo)
          // ],
        ),
      ),
    );
  }
}
