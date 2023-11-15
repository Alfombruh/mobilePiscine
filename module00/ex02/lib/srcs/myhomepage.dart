import 'dart:ffi';

import 'package:ex02/srcs/components/my_appbar.dart';
import 'package:ex02/srcs/components/my_calculator_buttons.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage(this.name, {super.key});

  final String name;
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey,
      appBar: MyAppBar(name: name),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: OperationText("0"),),
            OperationText("0"),
            MyCalculatorButtons(),
          ],
        ),
      ),
    ));
  }
}

class OperationText extends StatelessWidget {
  const OperationText(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w300,
        color: Colors.white,
        letterSpacing: -3,
      ),
    );
  }
}
