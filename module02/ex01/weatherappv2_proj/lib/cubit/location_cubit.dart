import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weatherappv2_proj/repositories/geolocation.dart';
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

  void geolocationSuggestions(String str) async {
    if (!state.locationToggle) {
      final locationList =
          await GeolocationRepository().getGeoLocationList(str);
      locationList.length;
      return;
    }
  }

  void getWeather() async {
    //todo, call api and try to find zone
  }

  void searchLocation(String text) =>
      emit(LocationState(location: text, locationToggle: false));

  Future<String> _getCurrentPosition() async {
    try {
      var coordinates = await GeolocationService().determinePosition();
      var geolocation = await GeolocationRepository()
          .getGeoLocation(coordinates.latitude, coordinates.longitude);
      return geolocation.city;
    } catch (error) {
      debugPrint("GeoLocatoin repo error ${error.toString()}");
      return "Couldn't get Location";
    }
  }
}
