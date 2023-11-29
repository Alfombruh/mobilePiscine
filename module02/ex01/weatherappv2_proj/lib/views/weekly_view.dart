import 'package:flutter/material.dart';

class WeeklyView extends StatelessWidget {
  const WeeklyView({required this.location, super.key});

  final String location;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Weekly\n$location",
      style: const TextStyle(fontSize: 24),)
    );
  }
}