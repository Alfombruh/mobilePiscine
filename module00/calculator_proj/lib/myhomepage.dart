import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = "";
  String expression = "";
  String finalExpression = "";

  void buttonAction(String value) {
    setState(() {
      if (value == "C") {
        if (expression.isEmpty) return;
        expression = expression.substring(0, expression.length - 1);
        return;
      }
      if (value == "AC") {
        result = "";
        expression = "";
        return;
      }
      if (value == "=") {
        finalExpression = expression;
        finalExpression = finalExpression.replaceAll('x', '*');
        finalExpression = finalExpression.replaceAll('÷', '/');
        try {
          Parser p = Parser();
          Expression exp = p.parse(finalExpression);
          ContextModel cm = ContextModel();

          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          if (result == "Infinity") {
            result = "Error";
          }
          debugPrint("Result is ==> $result");
        } catch (e) {
          result = "Syntax Error";
        }
        return;
      }
      expression = "$expression$value";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Center(
          child: Text(
            "Calculator",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    expression == "" ? "0" : expression,
                    style: TextStyle(
                        wordSpacing: -20,
                        fontSize: MediaQuery.of(context).size.height / 10,
                        color: Colors.grey),
                  ),
                  Text(
                    result == "" ? "0" : result,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 10,
                        color: Theme.of(context).colorScheme.background),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            color: Theme.of(context).colorScheme.background,
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalcButton("7", buttonAction),
                      CalcButton("8", buttonAction),
                      CalcButton("9", buttonAction),
                      CalcButton("AC", buttonAction),
                      CalcButton("C", buttonAction),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalcButton("4", buttonAction),
                      CalcButton("5", buttonAction),
                      CalcButton("6", buttonAction),
                      CalcButton("÷", buttonAction),
                      CalcButton("x", buttonAction),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalcButton("1", buttonAction),
                      CalcButton("2", buttonAction),
                      CalcButton("3", buttonAction),
                      CalcButton("-", buttonAction),
                      CalcButton("+", buttonAction),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalcButton("0", buttonAction),
                      CalcButton(".", buttonAction),
                      CalcButton("00", buttonAction),
                      CalcButton("=", buttonAction),
                      CalcButton("", buttonAction),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CalcButton extends StatelessWidget {
  const CalcButton(
    this.value,
    this.function, {
    super.key,
  });
  final String value;
  final Function(String) function;

  @override
  Widget build(BuildContext context) {
    double btnHeight = MediaQuery.of(context).size.height / 10;
    return SizedBox(
      height: btnHeight,
      child: TextButton(
        child: Text(value,
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height / 20)),
        onPressed: () => function(value),
      ),
    );
  }
}
