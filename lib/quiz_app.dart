import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  /// To store Scores
  List<Widget> scoreKeeper = [];
  QuizBrain quizBrain = QuizBrain();

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getAnswer();

    setState(() {
      if (quizBrain.isFinished()) {
        scoreKeeper = [];
        quizBrain.resetQuestionNumber();
        int totalScore = quizBrain.getScoreDetails();
        Alert(
          context: context,
          type: AlertType.success,
          title: "Quiz Complete!",
          desc: "Your Total Score: $totalScore",
          buttons: [
            DialogButton(
              child: Text(
                "Go Home!",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.popAndPushNamed(context, '/'),
              width: 120,
            )
          ],
        ).show();
      } else {
        if (correctAnswer == userPickedAnswer) {
          quizBrain.incrementScore();
          scoreKeeper.add(
            Text(
              '🥳',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          );
        } else {
          scoreKeeper.add(
            Text(
              '😭',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FlatButton(
                    onPressed: () {
                      Alert(
                        context: context,
                        type: AlertType.warning,
                        title: "Do you want to Quit?",
                        desc: "All your scores would be lost.",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Yes",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () =>
                                Navigator.popAndPushNamed(context, '/'),
                            color: Color(0xfff25f5c),
                          ),
                          DialogButton(
                            child: Text(
                              "Nope",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            color: Color(0xff02c39a),
                          ),
                        ],
                      ).show();
                    },
                    color: Color(0xfff25f5c),
                    textColor: Color(0xffd8e2dc),
                    child: Text(
                      "Quit!",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Dosis',
                      ),
                    ),
                  ),
                ),
              ),

              //Question:
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      quizBrain.getQuestion(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Color(0xff6d6875),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'AmaticSC',
                      ),
                    ),
                  ),
                ),
              ),

              //True Button
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FlatButton(
                    onPressed: () {
                      checkAnswer(true);
                      setState(
                        () {
                          quizBrain.nextQuestion();
                        },
                      );
                    },
                    color: Color(0xff02c39a),
                    textColor: Color(0xffd8e2dc),
                    child: Text(
                      "Yes! Yes! Yes! This is True.",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Dosis',
                      ),
                    ),
                  ),
                ),
              ),

              //False Button
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FlatButton(
                    onPressed: () {
                      checkAnswer(false);
                      setState(
                        () {
                          quizBrain.nextQuestion();
                        },
                      );
                    },
                    color: Color(0xfff25f5c),
                    textColor: Color(0xffd8e2dc),
                    child: Text(
                      "Nope. Not True!",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Dosis',
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        "Score Board",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'AmaticSC',
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: scoreKeeper,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
