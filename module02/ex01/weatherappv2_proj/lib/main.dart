// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherappv2_proj/cubit/location_cubit.dart';
import 'package:weatherappv2_proj/cubit/navigation_index_cubit.dart';
import 'package:weatherappv2_proj/views/currently_view.dart';
import 'package:weatherappv2_proj/views/tomorrow_view.dart';
import 'package:weatherappv2_proj/views/weekly_view.dart';

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
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LocationCubit(),
          ),
          BlocProvider(
            create: (context) => NavigationIndexCubit(),
          ),
        ],
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final myController = TextEditingController();
  final myPageController = PageController(initialPage: 0);
  final double searchBarRadius = 25;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Autocomplete<String>(
                optionsBuilder: (textEditingValue) {
                  return "Hola" as Iterable<String>;
                  //context.read<
                  //returns an iterable of matches
                  //return data.filter(entry)=>entry.contains(textEditingValue.text);
                },
              ),
              // title: TextField(
              //   enableSuggestions: true,
              //   controller: context.read<LocationCubit>().myController,
              //   onChanged: (text) =>
              //       context.read<LocationCubit>().searchLocation(text),
              //   decoration: const InputDecoration(
              //     border: UnderlineInputBorder(),
              //     labelText: 'Your location',
              //   ),
              // ),
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
              onPageChanged: (page) =>
                  context.read<NavigationIndexCubit>().state,
              children: const [
                CurrentlyView(),
                TomorrowView(),
                WeeklyView(),
              ],
            ),
            bottomNavigationBar: BlocBuilder<NavigationIndexCubit, int>(
              builder: (context, state) {
                return BottomNavigationBar(
                  currentIndex: context.read<NavigationIndexCubit>().state,
                  onTap: (value) {
                    context.read<NavigationIndexCubit>().changeIndex(value);
                    myPageController.animateToPage(
                      value,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
                  fixedColor: const Color(0xff19C3FB),
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.timer_outlined),
                      activeIcon: Icon(Icons.timer, color: Color(0xff19C3FB)),
                      label: "Current",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.today_outlined),
                      activeIcon: Icon(Icons.today, color: Color(0xff19C3FB)),
                      label: "Tomorrow",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.calendar_month_outlined),
                      activeIcon:
                          Icon(Icons.calendar_month, color: Color(0xff19C3FB)),
                      label: "Weekly",
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}
