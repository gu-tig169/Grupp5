import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:triviaholic/colors/CustomColors.dart';
import 'package:triviaholic/model/Player.dart';
import 'package:triviaholic/state/PlayerState.dart';
import 'package:triviaholic/view/widgets/gradient.dart';
import 'package:provider/provider.dart';

class EndScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Player player =
        Provider.of<PlayerState>(context, listen: false).getCurrentUser();
    player.currentScore > player.bestScore
        ? player.bestScore = player.currentScore
        : null;
    Provider.of<PlayerState>(context, listen: false).editPlayer(player);

    return Scaffold(
      body: Center(
        child: Gradienter(
          widget: Column(
            children: [
              aftergameText(),
              aftergameScore(player),
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

  Widget aftergameScore(Player player) {
    return Container(
      margin: EdgeInsets.only(top: 100, bottom: 60),
      alignment: Alignment.center,
      child: Text(
        player.currentScore.toString(),
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
            onPressed: () {
              switch (text) {
                case 'Main Menu':
                  return Navigator.pushNamed(context, '/start');
                case 'Leaderboard':
                  return Navigator.pushNamed(context, '/leaderboard');
                default:
              }
            }),
      ),
    );
  }
}
