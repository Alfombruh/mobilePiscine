import 'package:flutter/material.dart';
import 'package:weatherappv2_proj/model/geolocation.dart';
import 'package:weatherappv2_proj/provider/geolocation.dart';

typedef GeolocationList = List<GeoLocation>;

class GeolocationRepository {
  final GeolocationProvider _provider = GeolocationProvider();

  Future<GeoLocation> getGeoLocation(double latitude, double longitude) async {
    try {
      final response = await _provider.getGeoLocation(latitude, longitude);
      return GeoLocation.fromJson(response.toString());
    } catch (error) {
      throw Exception("Error fetching geolocation: $error");
    }
  }
  //TO-DO
  Future<List<GeoLocation>> getGeoLocationList(String str) async {
    try {
      final response = await _provider.getGeoLocationList(str);
      final List<dynamic> results = response['results'];
      final List<GeoLocation> list = List.empty();
      for (var i = 0; i < results.length; i++) {
        list.add(GeoLocation.fromMap(results[i]));
      }
      debugPrint("after the while (GeolocationList)=> ${list.toString()}");
      return list;
    } catch (error) {
      throw Exception(
          "(Geolocation repo) => Error fetching multiple geolocations: $error");
    }
  }
}
