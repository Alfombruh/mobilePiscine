import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weatherappv2_proj/services/geolocationservice.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit()
      : myController = TextEditingController(),
        super(LocationState(location: "", locationToggle: false));
  final TextEditingController myController;
  // TextEditingController();

  void geolocation() async {
    if (!state.locationToggle) {
      final currentLocation = await _getCurrentPosition();
      emit(LocationState(location: currentLocation, locationToggle: true));
      myController.text = "";
      return;
    }
    emit(LocationState(location: "", locationToggle: false));
  }

  void searchLocation(String text) =>
      emit(LocationState(location: text, locationToggle: false));

  Future<String> _getCurrentPosition() async {
    var geolocation = await GeolocationService().determinePosition();
    return "Lat: ${geolocation.latitude}\nLong: ${geolocation.longitude}";
  }
}
