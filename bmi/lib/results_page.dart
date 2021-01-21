import 'package:bmi/ReusableCard.dart';
import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';
import 'BottomButton.dart';

class ResultsPage extends StatelessWidget {
  @override
  double result_num = 0;
  String result_txt = "null";

  ResultsPage(this.interpretation, this.result_num, this.result_txt) {}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Result')),
      body: (Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Text(
              "Your Result",
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
                kInactiveCardColour,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "OVERWEIGHT",
                      style: TextStyle(color: Colors.green, fontSize: 30),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      result_num.toString(),
                      style: TextStyle(fontSize: 60, color: Colors.white),
                    ),
                    SizedBox(height: 30),
                    Text(result_txt)
                  ],
                ),
                () {}),
          ),
          BottomButton(
            "Return",
            () {
              Navigator.pop(context);
            },
          )
        ],
      )),
    );
  }
}
