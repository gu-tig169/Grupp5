import 'package:flutter/material.dart';
import 'package:triviaholic/view/createprofile_view.dart';
import 'package:triviaholic/view/leaderboard.dart';
import 'view/startgame_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LeaderboardView());
  }
}
