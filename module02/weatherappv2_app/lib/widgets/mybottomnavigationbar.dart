import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherappv2_proj/cubit/navigation_index_cubit.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    super.key,
    required this.myPageController,
  });

  final PageController myPageController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationIndexCubit, int>(
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
    );
  }
}
