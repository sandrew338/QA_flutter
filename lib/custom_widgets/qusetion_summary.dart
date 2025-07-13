import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  int indexOfQuestion = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            indexOfQuestion = (((data['question_index']) as int) + 1);
            return Row(children: [
              const SizedBox(
                width: 15,
              ),
              CircleAvatar(
                backgroundColor: data['correct_answer'] == data['user_answer']
                    ? Colors.green
                    : Colors.red,
                child: Text(indexOfQuestion.toString()),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    Text(
                      data['question'].toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Your answer: ${data['user_answer']}',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 228, 235, 28),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Right answer: ${data['correct_answer']}',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 21, 209, 40),
                        fontSize: 14,
                      ),
                    ),
                  ])),
                  const SizedBox(height: 90,)
            ]);

          }).toList(),

        ),
      ),
    );
  }
}
