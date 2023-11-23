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
          primary: const Color(0xff1D71F2),
          secondary: const Color(0xffFFCD00),
          background: const Color(0xffE3F4FE),
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
  double searchBarRadius = 25;

  void bottomBarChange(String value) {
    setState(() {
      location = value;
      label = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Your location',
              ),
            ),
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
              onPressed: () => {debugPrint("Geolocation button")},
              icon: const Icon(Icons.location_on_sharp),
            ),
          ),
          body: const TabBarView(
            children: [
              Center(child: Text("Today")),
              Center(child: Text("Tomorrow")),
              Center(child: Text("Weekly"))
            ],
          ),
          bottomNavigationBar: const BottomAppBar(
            child: SafeArea(
              child: TabBar(
                tabs: [
                  Tab(text: "Today"),
                  Tab(text: "Tomorrow"),
                  Tab(text: "Weekly"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
