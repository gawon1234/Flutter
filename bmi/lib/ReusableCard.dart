import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPresss;

  ReusableCard(@required this.colour, this.cardChild , this.onPresss ) {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPresss,
      child: Container(
        child: this.cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: this.colour, borderRadius: BorderRadius.circular(7)),
      ),
    );
  }


}




