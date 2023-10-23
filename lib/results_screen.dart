import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/quesitons_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswers, this.restart, {super.key});
  final void Function() restart;

  final List<String> chosenAnswers;
  List<Map<String, Object>> getSummaries() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'chosen_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaries();
    final answerdQuestions = summaryData
        .where((data) => data['correct_answer'] == data['chosen_answer'])
        .length;
    final totalQuestions = questions.length;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "You answered $answerdQuestions out of $totalQuestions questions",
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 237, 223, 255),
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionSummary(summaryData),
          // const Text("Lists of a and q s"),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
              onPressed: restart,
              icon: const Icon(
                Icons.restart_alt,
                color: Colors.white,
              ),
              label: const Text(
                "Restart Quiz",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ))
        ],
      ),
    );
  }
}
