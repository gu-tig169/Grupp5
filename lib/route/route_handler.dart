import 'package:flutter/material.dart';
import 'package:triviaholic/view/createprofile_view.dart';
import 'package:triviaholic/view/endScreen_view.dart';
import 'package:triviaholic/view/gameboard_view.dart';
import 'package:triviaholic/view/leaderboard.dart';
import 'package:triviaholic/view/profile.dart';
import 'package:triviaholic/view/loginView.dart';
import 'package:triviaholic/view/startgame_view.dart';

class RouteHandler {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => loginView());
      case "/start":
        return MaterialPageRoute(builder: (context) => StartGameView());
      case "/leaderboard":
        return MaterialPageRoute(builder: (context) => LeaderboardView());
      case "/create":
        return MaterialPageRoute(builder: (context) => CreateProfileView());
      case "/endscreen":
        return MaterialPageRoute(builder: (context) => EndScreenView());
      case "/profile":
        return MaterialPageRoute(builder: (context) => ProfileView());
      case "/game":
        return MaterialPageRoute(
            builder: (context) => GameBoardView(gameData: args));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("ERROR"),
        ),
        body: Center(
          child: Text("ERROR"),
        ),
      );
    });
  }
}