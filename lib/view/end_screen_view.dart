import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:triviaholic/colors/custom_colors.dart';
import 'package:triviaholic/model/player.dart';
import 'package:triviaholic/state/player_state.dart';
import 'package:triviaholic/view/widgets/gradient.dart';
import 'package:triviaholic/view/widgets/common_widgets.dart';

class EndScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Player player =
        Provider.of<PlayerState>(context, listen: false).getCurrentUser();
    if (player.currentScore > player.bestScore) {
      player.bestScore = player.currentScore;
    }
    Provider.of<PlayerState>(context, listen: false).editPlayer(player);

    return Scaffold(
      body: Center(
        child: Gradienter(
          widget: Column(
            children: [
              spaceBetween(80),
              appLogo(),
              spaceBetween(50),
              headerText('Congratulations! You got'),
              spaceBetween(20),
              _aftergameScore(player),
              spaceBetween(50),
              _appButton('Main Menu', context),
              _appButton('Leaderboard', context),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _aftergameScore(Player player) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        player.currentScore.toString() + ' points!',
        style: TextStyle(fontSize: 69, fontWeight: FontWeight.w800),
      ),
    );
  }

  Widget _appButton(text, context) {
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
