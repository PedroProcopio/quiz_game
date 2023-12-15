import 'package:flutter/material.dart';
import 'package:quizgame/start_screen.dart';
import 'package:quizgame/quiz_screen.dart';
import 'package:quizgame/result_screen.dart';
import 'package:quizgame/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String activeScreen = "start-screen";
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = "quiz-screen";
    });
  }

  void addAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = "start-screen";
      selectedAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = StartScreen(switchScreen);

    if (activeScreen == "quiz-screen") {
      screen = QuizScreen(
        onSelectAnswer: addAnswer,
      );
    }

    if (activeScreen == "result-screen") {
      screen = ResultScreen(
        userAnswers: selectedAnswers,
        restartQuiz: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple.shade700, Colors.deepPurple.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: screen,
          ),
        ),
      ),
    );
  }
}
