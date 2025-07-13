import 'package:flutter/material.dart';
import 'package:pofchure/custom_widgets/answer_button.dart';
import 'package:pofchure/data/questions.dart';
import 'package:pofchure/models/quiz_question.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key, required this.onSelectAnswer});
  final void Function(String) onSelectAnswer;
  @override
  State<QuestionsPage> createState() {
    return _QuestionsPageState();
  }
}

class _QuestionsPageState extends State<QuestionsPage> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    setState(() {
      widget.onSelectAnswer(selectedAnswer);
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final QuizQuestion currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              currentQuestion.text,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return AnswerButton(answer, () {answerQuestion(answer);});
            })
          ],
        ),
      ),
    );
  }
}
