class QuestionWithAnswers {
  final String question;
  final List<String> answers;
  String _answer;

  QuestionWithAnswers({this.question, this.answers});

  setAnswer(String answer) {
    _answer = answer;
  }

  String get answer {
    return _answer;
  }
}
