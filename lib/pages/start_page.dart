import 'package:flutter/material.dart';
class StartPage extends StatelessWidget {
  const StartPage(this.switchToQuizScreen, {super.key});
  final void Function() switchToQuizScreen;


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
              opacity: 0.5,
              child: Image.asset(
                'assets/images/quiz-logo.png',
                width: 300,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              'Learn Flutter the fun way!',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              onPressed: switchToQuizScreen,
              style: ElevatedButton.styleFrom(),
              icon: const Icon(
                Icons.arrow_circle_right_rounded,
                size: 20,
              ),
              label: Container(
                  color: const Color(0x00000000),
                  child: const Text('Start Quiz')),
            )
          ],
        ),
      );
  }
}