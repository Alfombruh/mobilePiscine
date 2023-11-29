import 'package:flutter/material.dart';

class TomorrowView extends StatelessWidget {
  const TomorrowView({required this.location, super.key});

  final String location;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Tomorrow\n$location",
      style: const TextStyle(fontSize: 24),)
    );
  }
}