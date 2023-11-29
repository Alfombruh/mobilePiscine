import 'package:flutter/material.dart';

class CurrentlyView extends StatelessWidget {
  const CurrentlyView({required this.location, super.key});

  final String location;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Current\n$location",
      style: const TextStyle(fontSize: 24),)
    );
  }
}
