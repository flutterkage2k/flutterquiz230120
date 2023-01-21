import 'package:flutter/material.dart';
import 'package:flutterquiz230120/constants.dart';

class NextButton extends StatelessWidget {
  final VoidCallback nextQuestion;

  NextButton({required this.nextQuestion});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextQuestion,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: neutral,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          'Next Question',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
