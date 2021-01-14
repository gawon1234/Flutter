import 'package:flutter/material.dart';
import 'Questions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Icon> scoreKeeper = [

  ];

  int i =0;

  List<Questions> questionBank = [
    Questions(q:"abc", a:true),
    Questions(q:"jfieow", a:true),
    Questions(q:"fghrhre", a:true),
    Questions(q:"bfewfe", a:false),
    Questions(q:"fffabdcvc", a:false),
    Questions(q:"hgtngt", a:false),

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
                  "Question ; " + questionBank[i].questionText,
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 350),
                FlatButton(
                  color: Colors.green,
                  onPressed: () {
                    print("clicked yes ");
                    result( true , questionBank[i].answerText );
                    setState(() {
                      i++;

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
                    result( false , questionBank[i].answerText );

                    setState(() {
                      i++;
                    });

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

  void result(userAnswer, answerText){
    if(userAnswer == questionBank[i].answerText) {
      // correct
      scoreKeeper.add( Icon(Icons.check) );
    }else{
      //incorrect
      scoreKeeper.add( Icon(Icons.close) );
    }
  }



}
