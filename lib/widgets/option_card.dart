import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String option;
  OptionCard({required this.option});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          option,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22.0),
        ),
      ),
    );
  }
}
