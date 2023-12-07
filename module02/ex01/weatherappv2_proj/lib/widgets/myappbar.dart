import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherappv2_proj/cubit/location_cubit.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SearchBar(
        leading: BlocBuilder<LocationCubit, LocationState>(
            builder: (context, state) {
          return IconButton(
            onPressed: () {
              context.read<LocationCubit>().geolocationSuggestions(context.read<LocationCubit>().myController.text);
            },
            icon: !state.locationToggle
                ? const Icon(Icons.location_off_outlined)
                : const Icon(Icons.location_on_sharp),
          );
        }),
        hintText: "your location",
        controller: context.read<LocationCubit>().myController,
        onChanged: (text)=> context.read<LocationCubit>().searchLocation(text),
        onSubmitted: (text) => context.read<LocationCubit>().geolocationSuggestions(text),
        //onChanged: (text) => context.read<LocationCubit>().searchLocation(text),
        //onSubmitted: (_) => debugPrint("buscando sitio bibipboop"),
        //onTap: () => debugPrint("estoy Tapeando bipbipbop"),
      ),
    );
    // return AppBar(
    //   title: TextField(
    //     enableSuggestions: true,
    //     controller: context.read<LocationCubit>().myController,
    //     onChanged: (text) =>
    //         context.read<LocationCubit>().searchLocation(text),
    //     decoration: const InputDecoration(
    //       border: UnderlineInputBorder(),
    //       labelText: 'Your location',
    //     ),
    //   ),
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.only(
    //         bottomLeft: Radius.circular(searchBarRadius),
    //         bottomRight: Radius.circular(searchBarRadius),
    //         topLeft: Radius.circular(searchBarRadius),
    //         topRight: Radius.circular(searchBarRadius)),
    //   ),
    //   backgroundColor: const Color(0xff19C3FB),
    //   centerTitle: true,
    //   leading: BlocBuilder<LocationCubit, LocationState>(
    //     builder: (context, state) {
    //       return IconButton(
    //         onPressed: () {
    //           context.read<LocationCubit>().geolocation();
    //         },
    //         icon: !state.locationToggle
    //             ? const Icon(Icons.location_off_outlined)
    //             : const Icon(Icons.location_on_sharp),
    //       );
    //     },
    //   ),
    // );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
