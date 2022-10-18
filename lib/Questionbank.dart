import 'package:quizzlerapp/main.dart';
import 'package:quizzlerapp/questions.dart';

class Quizbrain {
  int _questionnumber = 0;
  List<Questions> _questionBank = [
    Questions("did he ?", true),
    Questions("has he ?", false),
    Questions("have he ?", false),
    Questions("he he ?", true),
    Questions("he he he ", false),
    Questions("micheal Jackson", true),
  ];

  void nextQuestion() {
    if (_questionnumber < _questionBank.length - 1) {
      _questionnumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionnumber].questionText;
  }

  bool getQeustionNumber() {
    return _questionBank[_questionnumber].questionAnswer;
  }
}
