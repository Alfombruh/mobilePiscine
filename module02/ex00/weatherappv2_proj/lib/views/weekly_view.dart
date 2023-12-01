import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherappv2_proj/cubit/location_cubit.dart';

class WeeklyView extends StatelessWidget {
  const WeeklyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        return Center(
            child: Text(
          "Weekly\n${state.location}",
          style: const TextStyle(fontSize: 24),
        ));
      },
    );
  }
}
