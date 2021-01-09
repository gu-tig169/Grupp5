import 'dart:convert';

import 'package:triviaholic/model/Answer.dart';
import 'package:triviaholic/model/Player.dart';
import 'package:http/http.dart' as http;
import 'package:triviaholic/model/Question.dart';

class GameData {
  static final String url =
      'https://opentdb.com/api.php?amount=15&type=multiple&';

  static Future<List<Question>> getGameData(params) async {
    String paramsToString = '';
    params.forEach((value) => paramsToString = paramsToString + value + '&');

    http.Response response = await http.get(url + paramsToString);
    List<Question> questions = [];
    // var fixedJsonResponse = jsonResponse.replaceAll("&quot;", "'")

    var jsonResponse = response.body;
    var responseBody = jsonDecode(jsonResponse
        .replaceAll("&#039;", "'")
        .replaceAll("&quot;", "'")
        .replaceAll("&amp;", "&")
        .replaceAll("&oacute", "ó")
        .replaceAll("&Uuml", "Ü")
        .replaceAll("&shy;", "-")
        .replaceAll("&eacute", "é")
        )['results'];
        

    for (var question in responseBody) {
      List<Answer> answers = [];
      for (var incorrectAnswer in question['incorrect_answers']) {
        answers.add(Answer(incorrectAnswer, false));
      }
      answers.add(Answer(question['correct_answer'], true));
      answers.shuffle();
      questions.add(Question(question['question'], answers));
    }

    return questions;
  }
}
