import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/classes/QuestionWithAnswers.dart';
import 'package:quiz_app/question.dart';

void main() => runApp(MainPage());

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _questionIndex = 0;
  List<QuestionWithAnswers> _questions = [
    QuestionWithAnswers(
        question: 'What\'s your favorite Color?',
        answers: ['Blue', 'Yellow', 'Pink']),
    QuestionWithAnswers(
        question: 'What\'s your favorite Animal?',
        answers: ['Cat', 'Dog', 'Bird']),
    QuestionWithAnswers(
        question: 'What\'s your favorite Food?',
        answers: ['Hamburger', 'Pizza', 'Lasagna']),
  ];

  void onAnswerSelected(int answerIndex) {
    QuestionWithAnswers actualQuestion = _questions[_questionIndex];
    actualQuestion.setAnswer(actualQuestion.answers[answerIndex]);

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questions = _questions.map((question) {
        return QuestionWithAnswers(
            answers: question.answers, question: question.question);
      }).toList();
      _questionIndex = 0;
    });
  }

  Widget _renderText() {
    String question = _questionIndex < _questions.length
        ? _questions[_questionIndex].question
        : null;

    if (question != null) {
      return Question(question);
    } else {
      return _renderSelectedAnswers();
    }
  }

  Widget _renderAnswers() {
    final QuestionWithAnswers _question =
        _questionIndex < _questions.length ? _questions[_questionIndex] : null;
    List<Widget> answers = [];

    if (_question != null) {
      for (var i = 0; i < _question.answers.length; i++) {
        answers.add(Answer(
          onPress: () => onAnswerSelected(i),
          answer: _question.answers[i],
        ));
      }
    }

    return Column(
      children: answers,
    );
  }

  Widget _renderSelectedAnswers() {
    return Center(
      child: Column(children: <Widget>[
        Text(
          'Selected Answers',
          style: TextStyle(fontSize: 20),
        ),
        ..._questions.map((question) {
          return Text(
            question.question + ' ' + question.answer,
            style: TextStyle(fontSize: 15),
          );
        }).toList(),
      ]),
    );
  }

  Widget _renderResetAction() {
    if (_questionIndex > 0) {
      return IconButton(
        icon: Icon(Icons.cached),
        onPressed: _resetQuiz,
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[_renderText(), _renderAnswers()],
        ),
        appBar: AppBar(
          title: Text('Quiz App'),
          actions: <Widget>[
            _renderResetAction()
            // action button
          ],
        ),
      ),
    );
  }
}
