import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:triviaholic/colors/custom_colors.dart';
import 'package:triviaholic/model/game_round.dart';
import 'package:triviaholic/view/widgets/common_widgets.dart';
import 'package:triviaholic/view/widgets/gradient.dart';

// ignore: must_be_immutable
class GameBoardView extends StatefulWidget {
  GameRound gameData;
  int _currentQuestion = 0;
  bool _hasAnsweredQuestion = false;

  GameBoardView({this.gameData});

  @override
  _GameBoardViewState createState() => _GameBoardViewState();
}

class _GameBoardViewState extends State<GameBoardView> {
  Color _buttonColor1 = customPink;
  Timer _timer;
  int _counter = 15;
  bool _timerIsOn = true;

  @override
  Widget build(BuildContext context) {
    if (_timerIsOn) {
      _startTimer();
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: turquoiseGreen,
          title: Text('Triviaholic'),
          centerTitle: true,
        ),
        body: Gradienter(
          widget:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            spaceBetween(50),
            _questionText(),
            spaceBetween(20),
            _generateAnswerButtons(),
            spaceBetween(50),
            headerText("Time left:"),
            spaceBetween(10),
            headerText("$_counter Seconds"),
          ]),
        ));
  }

  void _startTimer() {
    _counter = 15;
    _timerIsOn = false;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (widget._hasAnsweredQuestion) {
          timer.cancel();
        } else if (_counter > 0) {
          _counter--;
        } else {
          if (widget._currentQuestion > widget.gameData.questions.length - 2) {
            timer.cancel();
            Navigator.popAndPushNamed(context, '/endscreen');
          } else {
            widget._currentQuestion++;
            timer.cancel();
            _timerIsOn = true;
          }
          timer.cancel();
        }
      });
    });
  }

  Widget _questionText() {
    return Center(
      child: Container(
          child: Text(
        widget.gameData.questions[widget._currentQuestion].question,
        style: TextStyle(fontSize: 22),
        textAlign: TextAlign.center,
      )),
    );
  }

  Widget _generateAnswerButtons() {
    return Column(
      children: widget.gameData.questions[widget._currentQuestion].answers
          .asMap()
          .entries
          .map((entry) => (entry.key % 2 == 0)
              ? Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = entry.key; i < entry.key + 2; i++)
                        _answerButton(
                            widget.gameData.questions[widget._currentQuestion]
                                .answers[i].title,
                            widget.gameData.questions[widget._currentQuestion]
                                .answers[i].correctAnswer)
                    ],
                  ),
                )
              : Container())
          .toList(),
    );
  }

  Widget _answerButton(String answer, bool correctAnswer) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: SizedBox(
        width: 170,
        height: 120,
        child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            color: !widget._hasAnsweredQuestion
                ? _buttonColor1
                : correctAnswer
                    ? Colors.green
                    : Colors.red,
            child: Text(
              answer,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            onPressed: () {
              setState(() {
                widget._hasAnsweredQuestion = true;
              });
              Future.delayed(Duration(seconds: 2), () {
                setState(() {
                  if (correctAnswer) {
                    widget.gameData.players.currentScore =
                        widget.gameData.players.currentScore + 10;
                  }

                  _timerIsOn = true;
                  if (widget._currentQuestion >
                      widget.gameData.questions.length - 2) {
                    _timerIsOn = false;
                    _timer.cancel();
                    Navigator.popAndPushNamed(context, '/endscreen');
                  } else {
                    widget._currentQuestion++;
                  }
                });
                widget._hasAnsweredQuestion = false;
              });
            }),
      ),
    );
  }
}
