import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Icon> scoreKeeper = [
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Question ; ",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 350),
                FlatButton(
                  color: Colors.green,
                  onPressed: () {
                    print("clicked yes ");
                    setState(() {
                      scoreKeeper.add( Icon(Icons.check, color: Colors.green,) );
                    });

                  },
                  child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 30),
                FlatButton(
                  color: Colors.red,
                  onPressed: () {
                    print("clicked no");



                  },
                  child: Text(
                    "No",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  children: scoreKeeper,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
