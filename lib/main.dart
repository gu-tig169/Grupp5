import 'package:flutter/material.dart';
import 'package:triviaholic/state/PlayerState.dart';
import 'view/createprofile_view.dart';
import 'package:triviaholic/view/endScreen_view.dart';
import 'package:triviaholic/view/gameboard_view.dart';
import 'package:triviaholic/view/leaderboard.dart';
import 'package:triviaholic/view/profile.dart';
import 'package:triviaholic/view/selectProfileView.dart';
import 'view/startgame_view.dart';
import 'package:provider/provider.dart';

void main() {
  var state = PlayerState();
  runApp(ChangeNotifierProvider(
      create: (context) => state,
      child: MaterialApp(routes: {
        '/': (context) => SelectProfileView(),
        '/start': (context) => StartGameView(),
        '/leaderboard': (context) => LeaderboardView(),
        '/create': (context) => CreateProfileView(),
        '/endscreen': (context) => EndScreenView(),
        '/profile': (context) => ProfileView(),
        '/game': (context) => GameBoardView(),
      })));
}
