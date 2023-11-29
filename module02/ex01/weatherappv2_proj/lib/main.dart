import 'package:flutter/material.dart';
import 'package:weatherappv2_proj/cubit/location_cubit.dart';
import 'package:weatherappv2_proj/views/currently_view.dart';
import 'package:weatherappv2_proj/views/tomorrow_view.dart';
import 'package:weatherappv2_proj/views/weekly_view.dart';
import 'services/geolocationservice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      home: BlocProvider(
        create: (context) => LocationCubit(),
        child: MyHomePage(title: 'Weather App'),
      ),
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
  final myController = TextEditingController();
  final myPageController = PageController(initialPage: 0);
  int selectedIndex = 0;
  bool locationToggle = false;
  String location = "";
  double searchBarRadius = 25;

  //To-do mover la parte de abajo a un cubit
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: TextField(
                controller: context.read<LocationCubit>().myController,
                onChanged: (text) =>
                    context.read<LocationCubit>().searchLocation(text),
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
              leading: BlocBuilder<LocationCubit, LocationState>(
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      context.read<LocationCubit>().geolocation();
                    },
                    icon: !state.locationToggle
                        ? const Icon(Icons.location_off_outlined)
                        : const Icon(Icons.location_on_sharp),
                  );
                },
              ),
            ),
            body: PageView(
              physics: const BouncingScrollPhysics(),
              controller: myPageController,
              onPageChanged: (page) => setState(() {
                selectedIndex = page;
              }),
              children: const [
                CurrentlyView(),
                TomorrowView(),
                WeeklyView(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (value) => setState(() {
                selectedIndex = value;
                myPageController.animateToPage(
                  value,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.timer_outlined),
                  activeIcon: Icon(Icons.timer),
                  label: "Current",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.today_outlined),
                  activeIcon: Icon(Icons.today),
                  label: "Tomorrow",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month_outlined),
                  activeIcon: Icon(Icons.calendar_month),
                  label: "Weekly",
                ),
              ],
            )),
      ),
    );
  }
}
