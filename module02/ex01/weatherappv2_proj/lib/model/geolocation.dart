import 'package:flutter/material.dart';

class GeoLocation {
  final double latitude;
  final double longitude;
  final String country; //country in the response call, may be county
  final String city; //name is the response

  GeoLocation(
      {required this.latitude,
      required this.longitude,
      required this.country,
      required this.city});

  factory GeoLocation.fromJson(Map<String, dynamic> json) {
    try {
      final dataList = json['data'] as List<dynamic>;
      if (dataList.isNotEmpty) {
        final data = dataList[0] as Map<String, dynamic>;
        debugPrint(data.toString());
        return GeoLocation(
          latitude: data['latitude'] as double,
          longitude: data['longitude'] as double,
          city: data['street'] as String,
          country: data['country'] as String,
        );
      }
      throw ("Is Empty");
    } catch (error) {
      debugPrint(error.toString());
      return GeoLocation(
          latitude: 0, longitude: 0, country: "Epoca", city: "Epoca");
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'city': city,
      'country': country,
    };
  }
}
