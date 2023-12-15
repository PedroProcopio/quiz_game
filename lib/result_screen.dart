import 'package:flutter/material.dart';
import 'package:quizgame/data/questions.dart';
import 'package:quizgame/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.userAnswers, required this.restartQuiz});

  final List<String> userAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getAnswersSummary() {
    List<Map<String, Object>> answersSummary = [];

    for (var i = 0; i < userAnswers.length; i++) {
      answersSummary.add({
        "question-index": i,
        "question": questions[i].question,
        "correct_answer": questions[i].answers[0],
        "user_answer": userAnswers[i],
      });
    }
    return answersSummary;
  }

  @override
  Widget build(context) {
    List<Map<String, Object>> answersSummary = getAnswersSummary();
    int totalnumberOfAnswers = questions.length;
    int numberOfCorrectAnswers = answersSummary
        .where((element) => element["correct_answer"] == element["user_answer"])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numberOfCorrectAnswers of $totalnumberOfAnswers questions correctly! ",
              style: const TextStyle(
                  color: Color.fromARGB(150, 255, 255, 255),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(
              summaryData: answersSummary,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: restartQuiz,
              label: const Text(
                "Restart",
                style: TextStyle(color: Colors.white),
              ),
              icon: const Icon(Icons.restart_alt, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
