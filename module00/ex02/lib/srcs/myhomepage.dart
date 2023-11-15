import 'package:ex02/srcs/components/my_appbar.dart';
import 'package:ex02/srcs/components/my_calculator_buttons.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage(this.name, {super.key});

  final String name;
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: MyAppBar(name: name),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OperationText(),
          MyCalculatorButtons(),
        ],
      ),
    ));
  }
}

class OperationText extends StatelessWidget {
  const OperationText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "aqui van las operaciones",
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w300,
        color: Colors.grey,
        letterSpacing: -3,
      ),
    );
  }
}
