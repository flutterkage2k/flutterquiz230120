import 'package:flutter/material.dart';
import 'package:flutterquiz230120/constants.dart';

class OptionCard extends StatelessWidget {
  final String option;
  final Color color;
  OptionCard({required this.option, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(
          option,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22.0,
              color: color.red != color.green ? neutral : Colors.black),
        ),
      ),
    );
  }
}
