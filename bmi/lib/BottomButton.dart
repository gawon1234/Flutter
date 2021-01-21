import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {

  final Function onTap;
  final String buttonTitle;

  BottomButton(this.buttonTitle, this.onTap){

  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Center(
          child: Text(
            this.buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top : 10),
        width: double.infinity,
        height: kBottomContainerHeight,
        padding: EdgeInsets.only(bottom: 10),
      ),
      onTap: () {
        print("clicked");
        this.onTap();
      },
    );
  }
}