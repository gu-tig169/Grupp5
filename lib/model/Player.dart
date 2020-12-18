import 'package:triviaholic/model/ProfileImage.dart';

class Player {
  String _username;
  int _amountOfGames = 0;
  int _averageScore = 0;
  int _bestScore = 0;
  String _image;

  Player(this._username, this._image,);

  String get username => _username;

  int get amountOfGames => _amountOfGames;

  int get averageScore => _averageScore;

  int get bestScore => _bestScore;

  String get image => _image;
}
