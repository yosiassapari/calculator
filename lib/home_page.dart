import 'package:calculator/my_button.dart';
import 'package:calculator/neu_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userQuestion = '';
  String userAnswer = '';
  List button = [
    "C", //BUTTON[0]
    "DEL", //BUTTON[1]
    "%", //BUTTON[2]
    "/", //BUTTON[3]
    "9", //BUTTON[4]
    "8", //BUTTON[5]
    "7", //BUTTON[6]
    "*", //BUTTON[7]
    "6", //BUTTON[8]
    "5", //BUTTON[9]
    "4", //BUTTON[10]
    "-", //BUTTON[11]
    "3", //BUTTON[12]
    "2", //BUTTON[13]
    "1", //BUTTON[14]
    "+", //BUTTON[15]
    "0", //BUTTON[16]
    ".", //BUTTON[17]
    "ANS", //BUTTON[18]
    "=", //BUTTON[19]
  ];

  void pressedButton(String button) {
    // clear is pressed
    if (button == 'C') {
      setState(() {
        userQuestion = '';
        userAnswer = '';
      });
    }

    //delete is pressed
    else if (button == 'DEL') {
      setState(() {
        userQuestion = userQuestion.isEmpty
            ? '' // avoid error when there is string is null
            : userQuestion.substring(0, userQuestion.length - 1);
      });
    }

    //equals is pressed
    else if (button == '=') {
      calculateExpression();
    }

    //rest of the buttons are pressed
    else {
      setState(() {
        userQuestion = userQuestion + button;
      });
    }
  }

  void calculateExpression() {
    String finalQuestion;
    // replace all division symbols to / and multiply symbols to *
    finalQuestion = userQuestion.replaceAll('from', '/');
    finalQuestion = finalQuestion.replaceAll('x', '*');

    Parser p = Parser();
    Expression expression = p.parse(userQuestion);
    ContextModel cm = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, cm);

    setState(() {
      userAnswer = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple[300],
        body: Column(
          children: [
            //display question and answer
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            userQuestion,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            userAnswer,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: GridView.builder(
                itemCount: button.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return NeuButton(
                      child: button[index],
                      color: Colors
                          .deepPurple[300], //Color.fromARGB(255, 69, 174, 76),
                      textColor: Colors.white,
                      function: () {
                        pressedButton(button[index]);
                      },
                    );
                  } else if (index == 1) {
                    return NeuButton(
                      child: button[index],
                      color: Colors.deepPurple[300],
                      textColor: Colors.white,
                      function: () {
                        pressedButton(button[index]);
                      },
                    );
                  } else if (index == 2 ||
                      index == 3 ||
                      index == 7 ||
                      index == 11 ||
                      index == 15 ||
                      index == 19) {
                    return NeuButton(
                      child: button[index],
                      color: Colors.deepPurple[300],
                      textColor: Colors.white,
                      function: () {
                        pressedButton(button[index]);
                      },
                    );
                  } else {
                    return NeuButton(
                      child: button[index],
                      color: Colors.deepPurple[300],
                      textColor: Colors.white,
                      function: () {
                        pressedButton(button[index]);
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
