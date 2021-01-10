import 'package:triviaholic/model/player.dart';
import 'package:triviaholic/model/question.dart';

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
