import 'package:triviaholic/model/ProfileImage.dart';

class Player {
  String username;
  int amountOfGames;
  int averageScore;
  int bestScore;
  String image;

  Player(
      {this.username,
      this.amountOfGames = 0,
      this.averageScore = 0,
      this.bestScore = 0,
      this.image});
/*
  String get username => _username;
  int get amountOfGames => _amountOfGames;
  int get averageScore => _averageScore;
  int get bestScore => _bestScore;
  String get image => _image;
  */
}
