import 'dart:io';

import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  const CalcButton(text, color, this.function, {super.key});

  final String text = "";
  final Color color = Colors.black;
  final void Function()? function;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: text == '=' ? 150 : 70,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          backgroundColor: color,
        ),
        child: Text(text,
            style: const TextStyle(fontSize: 27, color: Colors.white)),
      ),
    );
  }
}
