import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String textToDisplay;
  const HeadingText(this.textToDisplay);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20,bottom: 10,left: 10,right: 10),
      child: Text(
        "$textToDisplay",
        style: TextStyle(
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
          color: Colors.red[700],
        ),
      ),
    );
  }
}
