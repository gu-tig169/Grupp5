import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:triviaholic/colors/custom_colors.dart';
import 'package:triviaholic/model/game_round.dart';
import 'package:triviaholic/view/login_view.dart';
import 'package:triviaholic/view/widgets/gradient.dart';

// ignore: must_be_immutable
class GameBoardView extends StatefulWidget {
  int currentQuestion = 0;
  GameRound gameData;
  GameBoardView({this.gameData});
  bool hasAnsweredQuestion = false;

  @override
  _GameBoardViewState createState() => _GameBoardViewState();
}

class _GameBoardViewState extends State<GameBoardView> {
  Color _buttonColor1 = customPink;

  @override
  Widget build(BuildContext context) {
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
          ]),
        ));
  }

  Widget _questionText() {
    return Center(
      child: Container(
          child: Text(
        //gameData.questions[0].questions,
        widget.gameData.questions[widget.currentQuestion].question,

        style: TextStyle(fontSize: 22),
        textAlign: TextAlign.center,
      )),
    );
  }

  Widget _generateAnswerButtons() {
    return Column(
      children: widget.gameData.questions[widget.currentQuestion].answers
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
                            widget.gameData.questions[widget.currentQuestion]
                                .answers[i].title,
                            widget.gameData.questions[widget.currentQuestion]
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
            color: !widget.hasAnsweredQuestion
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
                widget.hasAnsweredQuestion = true;
              });
              Future.delayed(Duration(seconds: 2), () {
                setState(() {
                  correctAnswer
                      ? widget.gameData.players.currentScore =
                          widget.gameData.players.currentScore + 10
                      // ignore: unnecessary_statements
                      : null;

                  widget.currentQuestion > widget.gameData.questions.length - 2
                      ? Navigator.pushNamed(context, '/endscreen')
                      : widget.currentQuestion++;
                });
                widget.hasAnsweredQuestion = false;
              });
            }),
      ),
    );
  }

  Widget spaceBetweenWidth(double width) {
    return Container(
      width: 17,
    );
  }
}
