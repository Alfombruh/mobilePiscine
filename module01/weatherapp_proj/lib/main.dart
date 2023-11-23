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
  var myController = TextEditingController();
  String location = "";
  double searchBarRadius = 25;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: TextField(
              controller: myController,
              onChanged: (text) => setState(() {
                location = text;
              }),
              decoration: const InputDecoration(
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
              onPressed: () => setState(() {
                if (location.contains("Geolocation")) {
                  location = "";
                } else {
                  myController.text = "";
                  location = "Geolocation";
                }
              }),
              icon: !location.contains("Geolocation")
                  ? const Icon(Icons.location_off_outlined)
                  : const Icon(Icons.location_on_sharp),
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text("Today\n$location",
                    style: const TextStyle(fontSize: 24)),
              ),
              Center(
                child: Text("Tomorrow\n$location",
                    style: const TextStyle(fontSize: 24)),
              ),
              Center(
                child: Text("Weekly\n$location",
                    style: const TextStyle(fontSize: 24)),
              )
            ],
          ),
          bottomNavigationBar: const BottomAppBar(
            child: SafeArea(
              child: TabBar(
                tabs: [
                  Tab(text: "Currently", icon: Icon(Icons.wallpaper_outlined)),
                  Tab(
                    text: "Today",
                    icon: Icon(Icons.today_outlined),
                  ),
                  Tab(
                      text: "Weekly",
                      icon: Icon(Icons.calendar_month_outlined)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
