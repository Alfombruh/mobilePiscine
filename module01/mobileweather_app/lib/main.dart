import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: Color(0xff1D71F2),
          secondary: Color(0xffFFCD00),
          background: Color(0xffE3F4FE),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Weather App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String location = "";
  String label = "Today";
  double searchBarRadius = 30;

  void bottomBarChange(String value) {
    setState(() {
      location = value;
      label = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const TextField(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(searchBarRadius),
                bottomRight: Radius.circular(searchBarRadius),
                topLeft: Radius.circular(searchBarRadius),
                topRight: Radius.circular(searchBarRadius)),
          ),
          backgroundColor: const Color(0xff19C3FB),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => {
              showSearch(
                context: context,
                delegate: AppBarSearchDelegate(),
              )
            },
            icon: const Icon(Icons.location_on),
          ),
        ),
        body: Center(
          child: Text(label),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => bottomBarChange("Today"),
                child: const Text("Today"),
              ),
              TextButton(
                onPressed: () => bottomBarChange("Tomorrow"),
                child: const Text("Tomorrow"),
              ),
              TextButton(
                onPressed: () => bottomBarChange("Weekly"),
                child: const Text("Weekly"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarSearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) {
    return const Text("Fognite");
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return const [Text("Fognite"),];
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("Fognite");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text("Fognite");
  }
}
