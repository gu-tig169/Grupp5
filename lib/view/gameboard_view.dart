import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:triviaholic/colors/CustomColors.dart';
import 'package:triviaholic/view/selectProfileView.dart';
import 'package:triviaholic/view/widgets/gradient.dart';

class GameBoardView extends StatelessWidget {
  final List<String> choices = ['Stockholm', 'Göteborg', 'Åmål', 'Kungälv'];
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
        'Vad är Svea rikes huvudstad?',
        style: TextStyle(fontSize: 38),
        textAlign: TextAlign.center,
      )),
    );
  }

  Widget _generateAnswerButtons() {
    return Column(
      children: choices
          .asMap()
          .entries
          .map((entry) => (entry.key % 2 == 0)
              ? Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = entry.key; i < entry.key + 2; i++)
                        _answerButton(choices[i]),
                    ],
                  ),
                )
              : Container())
          .toList(),
    );
  }

  Widget _answerButton(String question) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: SizedBox(
        width: 170,
        height: 120,
        child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            color: customPink,
            child: Text(
              question,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            onPressed: () {}),
      ),
    );
  }

  Widget spaceBetweenWidth(double width) {
    return Container(
      width: 17,
    );
  }
}
