import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:triviaholic/assets/CustomColors.dart';
import 'package:triviaholic/view/widgets/navbar.dart';
import 'package:triviaholic/view/widgets/gradient.dart';

class StartGameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Gradienter(
          widget: Column(
            children: [
              homeText(),
              startgameButton(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget startgameButton(context) {
    return Container(
      margin: EdgeInsets.only(bottom: 50, top: 200),
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: 250,
        height: 70,
        child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            color: customPink,
            child: Text(
              'Start Game',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/game');
            }),
      ),
    );
  }

  Widget homeText() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      alignment: Alignment.center,
      child: Text(
        'Welcome to Triviaholic!',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
      ),
    );
  }
}
