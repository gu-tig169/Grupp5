import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:triviaholic/colors/CustomColors.dart';
import 'package:triviaholic/model/GameRound.dart';
import 'package:triviaholic/model/Question.dart';
import 'package:triviaholic/view/selectProfileView.dart';
import 'package:triviaholic/view/widgets/gradient.dart';
import 'package:triviaholic/Network/game_data.dart';

class GameBoardView extends StatefulWidget {
  int currentQuestion = 0;
  GameRound gameData;
  GameBoardView({this.gameData});

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
          title: Text('Game Board'),
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
  // Metot för att sätta färgen?
void resetbuttonColor () { 
    _buttonColor1 = customPink;
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
            color: _buttonColor1,
            child: Text(
              answer,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            onPressed: () {
              setState(() {
                // If-Statement för att byta färg på knappen vid rätt svar?
                if (correctAnswer == true) {
                  _buttonColor1 = Colors.green;
                } else {
                  _buttonColor1 = Colors.red;
                } 
              //  
              print(correctAnswer);
                widget.currentQuestion++;
                correctAnswer
                    ? widget.gameData.players.currentScore =
                        widget.gameData.players.currentScore + 10
                    : null;
                widget.currentQuestion > widget.gameData.questions.length - 1
                    ? Navigator.pushNamed(context, '/endscreen')
                    : null;

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
