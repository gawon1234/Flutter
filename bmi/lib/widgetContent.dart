import 'package:flutter/material.dart';
import 'constants.dart';

class widgetContent extends StatelessWidget {
  final Icon icon;
  final String txt;

  widgetContent(this.icon, this.txt) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        this.icon,
        SizedBox(height: 15),
        Text(this.txt , style: kLabelTextStyle),
      ],
    );
  }
}