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
                Text("text here"),
                Image(
                    image: AssetImage('images/diamond.png') ,
                ),
              ],
            ),
          ),
        ),
      ),
    );
