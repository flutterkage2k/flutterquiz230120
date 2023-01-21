import 'package:flutter/material.dart';
import 'package:flutterquiz230120/constants.dart';
import 'package:flutterquiz230120/models/question_model.dart';
import 'package:flutterquiz230120/widgets/next_button.dart';
import 'package:flutterquiz230120/widgets/option_card.dart';
import 'package:flutterquiz230120/widgets/question_widget.dart';
import 'package:flutterquiz230120/widgets/result_box.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  int score = 0;

  bool isPressed = false;

  bool isAlreadySelected = false;

  void nextQuestion() {
    if (index == _questions.length - 1) {
      showDialog(context: context, builder: (ctx) => ResultBox());
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        // Fluttertoast.showToast(
        //     msg: "선택을 하셔야합니다.",
        //     backgroundColor: Colors.white,
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.BOTTOM);

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('문제에 답을 하셔야합니다.'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }

  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
        setState(() {
          isPressed = true;
          isAlreadySelected = true;
        });
      }
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
        actions: [
          Padding(
            padding: EdgeInsets.all(18),
            child: Text(
              '점수: $score',
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
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
              GestureDetector(
                onTap: () => checkAnswerAndUpdate(
                  _questions[index].options.values.toList()[i],
                ),
                child: OptionCard(
                  option: _questions[index].options.keys.toList()[i],
                  color: isPressed
                      ? _questions[index].options.values.toList()[i] == true
                          ? correct
                          : incorrent
                      : neutral,
                ),
              )
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
