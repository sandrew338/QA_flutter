import 'package:flutter/material.dart';
import 'package:pofchure/custom_widgets/qusetion_summary.dart';
import 'package:pofchure/data/questions.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(this.selectedAnswers,
      {super.key, required this.switchToStartScreen});
  final List<String> selectedAnswers;
  final void Function() switchToStartScreen;
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final int numberOfTotalQuestions = questions.length;
    final numberOfRightAnswers = summaryData
        .where((item) => item['correct_answer'] == item['user_answer'])
        .length;
    return SizedBox(
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You answered $numberOfRightAnswers out of $numberOfTotalQuestions questions correctly!',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionSummary(summaryData),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                onPressed: switchToStartScreen,
                style: ElevatedButton.styleFrom(),
                icon: const Icon(
                  Icons.restart_alt,
                  size: 20,
                ),
                label: Container(
                    color: const Color(0x00000000),
                    child: const Text('Restart quiz')),
              )
            ]));
  }
}
