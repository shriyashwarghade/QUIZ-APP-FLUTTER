import 'dart:math';

import 'package:flutter/material.dart';

import 'ques.dart';

//APP CONSTANTS
var _THEME_COLOUR_ = const Color(0xff0A3D62);

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int totalQues = 3;
  int solvedQues = 0;
  String nextQue = "";
  String quiz_status = "START";
  String score = "";
  String op1, op2, op3, op4, answer;
  bool isQuizStarted = false;
  int finalScore = 0;
  List<int> solvedQuesIndexes = [];

  void check_ans(String value) {
    print(value);
    setState(() {
      solvedQues += 1;
      if (value == answer) {
          finalScore += 1;
        }
      if (solvedQues == 3) {
        isQuizStarted = false;
        score = "SCORE: $finalScore/$totalQues";
        nextQue = "";
        op1 = "";
        op2 = "";
        op3 = "";
        op4 = ""; 
      } else {
        var index = Random().nextInt(QUES.length);
        while (solvedQuesIndexes.contains(index)) {
          index = Random().nextInt(QUES.length);
        }
        solvedQuesIndexes.add(index);
        List<String> ans = QUES[index]['answers'];
        nextQue = QUES[index]['question'];
        op1 = ans[0];
        op2 = ans[1];
        op3 = ans[2];
        op4 = ans[3];
        answer = ans[QUES[index]['correctIndex']];
      }
    });
  }

  void start_quiz() {
    print("In");
    setState(() {
      finalScore = 0;
      solvedQues = 0;
      isQuizStarted = true;
      score = "";
      quiz_status = "RESTART";
      solvedQuesIndexes = [];
      var index = Random().nextInt(QUES.length);
      while (solvedQuesIndexes.contains(index)) {
        index = Random().nextInt(QUES.length);
      }
      solvedQuesIndexes.add(index);
      List<String> ans = QUES[index]['answers'];
      nextQue = QUES[index]['question'];
      op1 = ans[0];
      op2 = ans[1];
      op3 = ans[2];
      op4 = ans[3];
      answer = ans[QUES[index]['correctIndex']];
    });
  }

  // String nextque = "Whats is the scientific name of a butterfly?";
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _THEME_COLOUR_,
        title: Text(
          "QUIZ",
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        centerTitle: true,
      ),
      // backgroundColor: _THEME_BG_COLOUR_,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 10.0),
                child: Text(
                  "Questions: $solvedQues/$totalQues".toUpperCase(),
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[700],
                  ),
                ),
              ),
              Container(
                width: screen_width,
                child: Text(
                  "$nextQue",
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 27.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              //Answer Button
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 10.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed:
                            isQuizStarted ? () => check_ans("$op1") : null,
                        color: Colors.lightBlue[800],
                        minWidth: screen_width,
                        height: 60.0,
                        child: Text(
                          "$op1",
                          style: TextStyle(
                            fontSize: 24.0,
                            // fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed:
                            isQuizStarted ? () => check_ans("$op2") : null,
                        color: Colors.lightBlue[800],
                        minWidth: screen_width,
                        height: 60.0,
                        child: Text(
                          "$op2",
                          style: TextStyle(
                            fontSize: 24.0,
                            // fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed:
                            isQuizStarted ? () => check_ans("$op3") : null,
                        color: Colors.lightBlue[800],
                        minWidth: screen_width,
                        height: 60.0,
                        child: Text(
                          "$op3",
                          style: TextStyle(
                            fontSize: 24.0,
                            // fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed:
                            isQuizStarted ? () => check_ans("$op4") : null,
                        color: Colors.lightBlue[800],
                        minWidth: screen_width,
                        height: 60.0,
                        child: Text(
                          "$op4",
                          style: TextStyle(
                            fontSize: 24.0,
                            // fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 10.0),
                child: Text(
                  "$score".toUpperCase(),
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[700],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: start_quiz,
                  color: Colors.green[800],
                  minWidth: screen_width,
                  height: 60.0,
                  child: Text(
                    "$quiz_status",
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
