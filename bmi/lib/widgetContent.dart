import 'package:flutter/material.dart';

class widgetContent extends StatelessWidget {
  final Icon icon;
  final Text txt;

  widgetContent(this.icon, this.txt) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [this.icon, SizedBox(height: 15), this.txt],
    );
  }
}