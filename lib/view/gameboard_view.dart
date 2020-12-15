import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:triviaholic/assets/CustomColors.dart';
import 'package:triviaholic/view/selectProfileView.dart';
import 'package:triviaholic/view/widgets/gradient.dart';

class GameBoardView extends StatelessWidget {
  final List<String> choices = ['Stockholm', 'Göteborg', 'Malmö', 'Kungälv'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: turquoiseGreen,
          title: Text('Game Board'),
          centerTitle: true,
        ),
        body: Gradienter(
          widget: Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 50, 0, 0),
              child: Column(children: [
                _questionText(),
                spaceBetween(20),
              ]),
            ),
          ),
        ));
  }

  Widget _questionText() {
    return Center(
      child: Container(
          child: Text(
        'Vad är Svea rikes huvudstad?',
        style: TextStyle(fontSize: 38),
      )),
    );
  }

  Widget _answerButton(String question) {
    return Container(
      alignment: Alignment.bottomCenter,
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
