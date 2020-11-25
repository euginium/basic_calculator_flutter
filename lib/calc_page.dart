import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'calc_button.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcPage extends StatefulWidget {
  @override
  _CalcPageState createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  String questions = '';
  String ans = '';
  List<String> calcList = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'X',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    '=',
  ];

  void Calculation() {
    questions = questions.replaceAll('X', '*');
    Parser p = Parser();
    Expression exp = p.parse(questions);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    ans = eval.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 15.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$questions',
                      style: TextStyle(
                        fontSize: 40.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '$ans',
                          style: TextStyle(
                            fontSize: 50.0,
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
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 0.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0.0),
                  topLeft: Radius.circular(40.0),
                ),
              ),
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Positioned(
                    top: -40.0,
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: GridView.builder(
                      itemCount: calcList.length,
                      itemBuilder: (context, int index) {
                        if (index == 0) {
                          return CalcButton(
                            buttonText: calcList[index],
                            buttonColor: Colors.indigo,
                            buttonTapped: () {
                              setState(() {
                                questions = '';
                              });
                            },
                          );
                        } else if (index == 1) {
                          return CalcButton(
                            buttonText: calcList[index],
                            buttonColor: Colors.red,
                            buttonTapped: () {
                              setState(() {
                                questions = questions.substring(
                                    0, questions.length - 1);
                              });
                            },
                          );
                        } else if (index == calcList.length - 1) {
                          return CalcButton(
                            buttonText: calcList[index],
                            buttonColor: Colors.green,
                            buttonTapped: () {
                              setState(() {
                                Calculation();
                              });
                            },
                          );
                        } else {
                          return CalcButton(
                            buttonText: calcList[index],
                            buttonColor: isOperator(calcList[index])
                                ? Colors.orangeAccent
                                : Colors.grey.shade800,
                            buttonTapped: () {
                              setState(() {
                                questions += calcList[index];
                              });
                            },
                          );
                        }
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 5.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

bool isOperator(String x) {
  if (x == '/' || x == '%' || x == 'X' || x == '+' || x == '-') {
    return true;
  } else {
    return false;
  }
}
