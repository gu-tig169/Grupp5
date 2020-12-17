import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:triviaholic/colors/CustomColors.dart';
import 'package:triviaholic/view/widgets/gradient.dart';

class EndScreenView extends StatefulWidget {
  @override
  _EndScreenViewState createState() => _EndScreenViewState();
}

class _EndScreenViewState extends State<EndScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Gradienter(
          widget: Column(
            children: [
              aftergameText(),
              aftergameScore(),
              appButton('Restart', context),
              appButton('Main Menu', context),
              appButton('Leaderboard', context),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget aftergameText() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      alignment: Alignment.center,
      child: Text(
        'Congratulations! You got',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget aftergameScore() {
    return Container(
      margin: EdgeInsets.only(top: 100, bottom: 60),
      alignment: Alignment.center,
      child: Text(
        '100 p',
        style: TextStyle(fontSize: 69, fontWeight: FontWeight.w800),
      ),
    );
  }

  Widget appButton(text, context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 10),
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: 200,
        height: 60,
        child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: customPink)),
            color: customPink,
            child: Text(
              text,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            ),
            onPressed: () {}),
      ),
    );
  }
}
