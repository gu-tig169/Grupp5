import 'package:triviaholic/model/Player.dart';
import 'package:triviaholic/model/Question.dart';

class GameRound {
  String _difficulty;
  int _amountOfQuestions;
  String _category;
  List<Player> _players;
  List<Question> _questions;

  GameRound(this._difficulty, this._amountOfQuestions, this._category,
      this._players, this._questions);
}
