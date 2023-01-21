import 'package:flutter/material.dart';
import 'package:flutterquiz230120/constants.dart';
import 'package:flutterquiz230120/models/question_model.dart';
import 'package:flutterquiz230120/widgets/next_button.dart';
import 'package:flutterquiz230120/widgets/option_card.dart';
import 'package:flutterquiz230120/widgets/question_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Question> _questions = [
    Question(id: '10', title: '오늘의 날씨', options: {
      '맑음': false,
      '맑음2': true,
      '맑음5': false,
      '맑음3': false,
    }),
    Question(id: '11', title: '오늘의 날씨3', options: {
      '맑음': false,
      '맑음2': true,
      '맑음5': false,
      '맑음3': false,
    })
  ];

  int index = 0;

  void nextQuestion() {
    if (index == _questions.length - 1) {
      return;
    } else {
      setState(() {
        index++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text("Quiz App"),
        backgroundColor: background,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            QuestionWidget(
              question: _questions[index].title,
              indexAction: index,
              totalQuestions: _questions.length,
            ),
            const Divider(
              color: neutral,
            ),
            const SizedBox(
              height: 25.0,
            ),
            for (int i = 0; i < _questions[index].options.length; i++)
              OptionCard(option: _questions[index].options.keys.toList()[i])
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
