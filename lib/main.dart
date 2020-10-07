import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_app.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Color(0xffefe5dc),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: QuizApp(),
            ),
          ),
        ),
        initialRoute: '/',
        routes: {'/quizPage': (context) => QuizPage()},
      ),
    );

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Text(
            "Test Your Skills!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'DancingScript',
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              "\t \t \t \t \t \t \t \t \t \t \t \t \t RULES ❓ \n"
              " 👉🏼  You cannot go back once you answer a question. \n"
              " 👉🏼  Score Card would be Displayed on the bottom of the page. \n"
              " 👉🏼  5 points for every right Answer. There are totally 13 questions.  \n"
              "\n"
              "\t \t \t \t \t \t \t \t \t \t \t \t \t SCORE BOARD 💯 \n"
              "🥳 - For Every Right Answer \n"
              "😭 - for Every Wrong Answer \n",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                fontFamily: 'AmaticSC',
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/quizPage');
              },
              color: Color(0xff02c39a),
              textColor: Color(0xffd8e2dc),
              child: Text(
                "Take me to the Quiz!",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Dosis',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
