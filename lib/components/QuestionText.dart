import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  final String textToDisplay;
  final double screenWidth;
  const QuestionText(this.textToDisplay,this.screenWidth);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: screenWidth,
      child: Text(
        "$textToDisplay",
        softWrap: true,
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
