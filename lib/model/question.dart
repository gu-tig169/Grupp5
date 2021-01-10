import 'package:triviaholic/model/answer.dart';

class Question {
  String _question;
  List<Answer> _answers;

  Question(this._question, this._answers);

  String get question {
    return _question;
  }

  List<Answer> get answers {
    return _answers;
  }
}
