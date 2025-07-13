import 'package:flutter/material.dart';
import 'package:pofchure/pages/questions_page.dart';
import 'package:pofchure/pages/result_page.dart';
import 'package:pofchure/pages/start_page.dart';
import 'package:pofchure/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  Widget? activeScreen;
  @override
  void initState() {
    super.initState();
    activeScreen = StartPage(switchToQuizScreen);
  }

  void switchToQuizScreen() {
    setState(() {
      activeScreen = QuestionsPage(onSelectAnswer: chooseAnswer);
    });
  }

  void switchToStartScreen() {
    setState(() {
      activeScreen = StartPage(switchToQuizScreen);
    });
  }

  void chooseAnswer(String answer) {
        selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultPage(selectedAnswers, switchToStartScreen: switchToStartScreen,);
        selectedAnswers = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(103, 58, 183, 1),
      body: activeScreen,
    );
  }
}
