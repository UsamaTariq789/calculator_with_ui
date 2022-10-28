import 'package:calculator_with_ui/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userinput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff22252D),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 40,
                  left: 40,
                  bottom: 40,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        userinput,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          color: Color(0xffF8F8F9),
                          fontSize: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        answer,
                        style: const TextStyle(
                          color: Color(0xffF8F8F9),
                          fontSize: 45,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xff292D36),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          title: 'AC',
                          color: const Color(0xff26EAC7),
                          onpress: () {
                            userinput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '+/-',
                          color: const Color(0xff26EAC7),
                          onpress: () {
                            userinput += '+/-';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '%',
                          color: const Color(0xff26EAC7),
                          onpress: () {
                            userinput += '%';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '/',
                          color: const Color(0xffE36364),
                          onpress: () {
                            userinput += '/';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '7',
                          onpress: () {
                            userinput += '7';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '8',
                          onpress: () {
                            userinput += '8';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '9',
                          onpress: () {
                            userinput += '9';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: 'x',
                          color: const Color(0xffE36364),
                          onpress: () {
                            userinput += 'x';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '4',
                          onpress: () {
                            userinput += '4';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '5',
                          onpress: () {
                            userinput += '5';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '6',
                          onpress: () {
                            userinput += '6';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '-',
                          color: const Color(0xffE36364),
                          onpress: () {
                            userinput += '-';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '1',
                          onpress: () {
                            userinput += '1';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '2',
                          onpress: () {
                            userinput += '2';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '3',
                          onpress: () {
                            userinput += '3';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '+',
                          color: const Color(0xffE36364),
                          onpress: () {
                            userinput += '+';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '⌫',
                          onpress: () {
                            userinput =
                                userinput.substring(0, userinput.length - 1);
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '0',
                          onpress: () {
                            userinput += '0';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '.',
                          onpress: () {
                            userinput += '.';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '=',
                          color: const Color(0xffE36364),
                          onpress: () {
                            pressequal();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void pressequal() {
    String finalUserinput = userinput;
    finalUserinput = userinput.replaceAll('x', '*');

    Parser p = Parser();
    Expression expression = p.parse(finalUserinput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, ContextModel());

    answer = eval.toString();
  }
}
