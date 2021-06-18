import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

class QuizData extends ChangeNotifier {
  List<Icon> scoreIcon = [];
  int correctAnswers = 0;

  void calculateScore(bool answer) {
    if (quizBrain.getAnswers() == answer) {
      correctAnswers++;
      scoreIcon.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      scoreIcon.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
    notifyListeners();
  }

  String getQuestions() {
    return quizBrain.getQuestions();
  }

  void resetQuiz() {
    scoreIcon = [];
    correctAnswers = 0;
    quizBrain.resetQuiz();
  }

  void nextQuestion() {
    quizBrain.nextQuestion();
  }

  bool isFinish() {
    return quizBrain.isFinish();
  }
}
