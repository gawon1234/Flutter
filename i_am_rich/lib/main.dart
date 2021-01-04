import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text('I am rich'),
          ),
          backgroundColor: Colors.blue,
          body: Center(
            child: Column(
              children: [
                Text('this is body'),
                Image(
                    image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                )
              ],
            ),
          ),
        ),
      ),
    );
