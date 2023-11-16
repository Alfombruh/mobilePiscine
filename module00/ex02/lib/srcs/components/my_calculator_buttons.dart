import 'dart:io';

import 'dart:developer' as developer;
import 'package:flutter/material.dart';

class MyCalculatorButtons extends StatelessWidget {
  const MyCalculatorButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CalculatorRow(x: "+", y: "-", z: "x", k: "/"),
        CalculatorRow(x: "7", y: "8", z: "9", k: "C"),
        CalculatorRow(x: "4", y: "5", z: "6", k: "AC"),
        CalculatorRow(x: "1", y: "2", z: "3", k: "="),
        CalculatorRow(x: "0", y: "00", z: ".", k: "FUN"),
      ],
    );
  }
}

class CalculatorRow extends StatelessWidget {
  const CalculatorRow({
    required this.x,
    required this.y,
    required this.z,
    required this.k,
    super.key,
  });

  final String x;
  final String y;
  final String z;
  final String k;

  void compute(String value) {
    if (value == "FUN") {
      exit(0);
    }
    developer.log("pressed button: $value");
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CalcButton(onPressed: compute, value: x),
        CalcButton(onPressed: compute, value: y),
        CalcButton(onPressed: compute, value: z),
        CalcButton(onPressed: compute, value: k),
      ],
    );
  }
}

class CalcButton extends StatelessWidget {
  const CalcButton({required this.onPressed, required this.value, super.key});

  final Function(String) onPressed;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 2),
        child: TextButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black38),
                // backgroundColor: MaterialStatePropertyAll(Colors.black38),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))))),
            onPressed: () => onPressed(value),
            child: Text(
              value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w200),
            )),
      ),
    );
  }
}
