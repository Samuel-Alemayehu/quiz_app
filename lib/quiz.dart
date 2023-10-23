import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/question_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<StatefulWidget> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  List<String> answers = [];
  void changeScreen() {
    setState(() {
      activeScreen = QuestionScreen(onAnswer);
    });
  }

  void restart() {
    setState(() {
      activeScreen = StartScreen(changeScreen);
      answers = [];
    });
  }

  void onAnswer(String answer) {
    answers.add(answer);
    if (answers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(answers, restart);
        answers = [];
      });
    }
  }

  Widget? activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(changeScreen);
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 15, 151),
              Color.fromARGB(255, 107, 15, 168),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Center(child: activeScreen),
        ),
      ),
    );
  }
}
