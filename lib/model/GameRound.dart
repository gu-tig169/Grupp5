import 'package:triviaholic/model/Player.dart';
import 'package:triviaholic/model/Question.dart';

class GameRound {
  String difficulty;
  int amountOfQuestions;
  String category;
  Player players;
  List<Question> questions;

  GameRound(
      {this.difficulty = 'Easy',
      this.amountOfQuestions = 15,
      this.category = 'Sports',
      this.players,
      this.questions});
}
