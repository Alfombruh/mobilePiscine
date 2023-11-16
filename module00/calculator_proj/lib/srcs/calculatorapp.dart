import 'package:calculator_proj/srcs/calcbutton.dart';
import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resolutFontSize = 48.0;

  buttonPressed(String buttonText) {
    return ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Calculator")),
          elevation: 0,
          backgroundColor: Colors.black54,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      OutputText(result: result),
                      InputText(equation: equation),
                      IconButton(
                        icon: const Icon(Icons.backspace_outlined,
                            color: Colors.orange, size: 30),
                        onPressed: () {
                          buttonPressed("SEXO");
                        },
                      ),
                      const SizedBox(width: 20,),
                    ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton('AC', Colors.white24, () => buttonPressed("AC")),
                  CalcButton('C', Colors.white24, () => buttonPressed("C")),
                  CalcButton('x', Colors.white24, () => buttonPressed("x")),
                  CalcButton('/', Colors.white24, () => buttonPressed("/")),
                ],
              ),
            ],
          ),
        ));
  }
}

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    required this.equation,
  });

  final String equation;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            equation,
            style: const TextStyle(
              color: Colors.white38,
              fontSize: 40,
            ),
          ),
        ),
      ],
    );
  }
}

class OutputText extends StatelessWidget {
  const OutputText({
    super.key,
    required this.result,
  });

  final String result;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            result,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 80,
            ),
          ),
        ),
        const Icon(
          Icons.arrow_back_ios,
          color: Colors.orange,
          size: 30,
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
