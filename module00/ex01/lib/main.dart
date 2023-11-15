import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => MyAppState(),
        child: MaterialApp(
          title: 'ex01',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                background: const Color.fromARGB(101, 234, 6, 196),
                seedColor: const Color.fromARGB(0xff, 255, 140, 00)),
          ),
          home: MyHomePage(),
        ));
  }
}

class MyAppState extends ChangeNotifier {
  String text = "Default Text";

  void changeMessage() {
    switch (text) {
      case "Hello World!":
        print("case 0");
        text = "Default text";
        notifyListeners();
        break;
      case "Default text":
        print("case 1");
        text = "Hello World!";
        notifyListeners();
        break;
      default:
        print("default case");
        text = "Easter Egg !!!!WOW!!!!";
        notifyListeners();
        text = "Default text";
    }
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const MyPage();
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            appState.text,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 20,
              fontFamily: 'Roboto',
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            child: const Text("Click here!"),
            onPressed: () => appState.changeMessage(),
          )
        ],
      ),
    ));
  }
}
