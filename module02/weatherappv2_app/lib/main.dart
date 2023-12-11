// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherappv2_proj/cubit/location_cubit.dart';
import 'package:weatherappv2_proj/cubit/navigation_index_cubit.dart';
import 'package:weatherappv2_proj/views/currently_view.dart';
import 'package:weatherappv2_proj/views/tomorrow_view.dart';
import 'package:weatherappv2_proj/views/weekly_view.dart';
import 'package:weatherappv2_proj/widgets/myappbar.dart';
import 'package:weatherappv2_proj/widgets/mybottomnavigationbar.dart';

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

  final myPageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: const MyAppBar(),
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
            bottomNavigationBar: MyBottomNavigationBar(myPageController: myPageController)),
      ),
    );
  }
}



