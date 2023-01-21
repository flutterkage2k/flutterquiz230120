import 'package:flutter/material.dart';
import 'package:flutterquiz230120/constants.dart';

class ResultBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: EdgeInsets.all(70),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '결과',
              style: TextStyle(color: neutral),
            )
          ],
        ),
      ),
    );
  }
}
