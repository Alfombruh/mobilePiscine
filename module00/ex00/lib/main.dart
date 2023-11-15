import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ex00',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(0xff, 255, 140, 00))
            .copyWith(background: const Color.fromARGB(240, 0, 230, 230)),
      ),
      home: const MyHomePage('ex00 Just a Widget'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Just an Elevated Button",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "RobotoMono"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.elliptical(10, 5)),
                  side: BorderSide.none),
              backgroundColor: const Color.fromARGB(0xff, 255, 140, 00),
              foregroundColor: const Color.fromARGB(255, 30, 30, 30),
              shadowColor: const Color.fromARGB(255, 0, 0, 0),
            ),
            child: const Text("click here!",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w900)),
            onPressed: () => print("Button pressed"),
          ),
        ],
      ),
    ));
  }
}
