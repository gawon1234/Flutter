import 'dart:ui';
import 'package:flutter/material.dart';

void main()  => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

const List<String> Questions = ["ab", "cd", "jfioew", "ijfw", "oijfnwe", "ab", "cd", "jfioew", "ijfw", "oijfnwe"];
const List<int> Answers = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
int totalScore = 0, whichQ = 0;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text("Question here : " + Questions[whichQ] , style: TextStyle(fontSize: 20, color: Colors.white) ),
            ),
            SizedBox(
              height: 400,
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(horizontal: 150, vertical: 20),
              onPressed: () {

                setState(() {
                  clicked(whichQ,1);
                  //moveToNextQ(whichQ);
                  result(whichQ, 1);
                });
              },
              child: Text("True"),
              color: Colors.green,
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(horizontal: 150, vertical: 20),
              onPressed: () {

                setState(() {
                  clicked( whichQ,2 );
                  //moveToNextQ(whichQ);

                  result(whichQ, 2);
                });
              },
              child: Text("false"),
              color: Colors.red,
            ),
            SizedBox(
              height: 20,
            ),
            Text("Total Score = $totalScore", style: TextStyle(color: Colors.white), )
          ],
        ),
      ),
    );
  }

  void clicked(int whichQQ, int whichButton){
    print('$whichQQ and $whichButton');

    moveToNextQ(whichQQ);
  }

  void result(int whichQ, int whichButton){

    if( Answers[whichQ] == whichButton ) {
      totalScore++;
      print('Correct!!!! Score = $totalScore');
    }
    else{
      print('Wrong. Score = $totalScore');
    }
  }


  void moveToNextQ(int whichQQ){
    if(whichQQ < Questions.length) {
      whichQ++;
      print("which Q = $whichQ");
    }
    else{
      print("GAME OVER");

    }


  }


}
