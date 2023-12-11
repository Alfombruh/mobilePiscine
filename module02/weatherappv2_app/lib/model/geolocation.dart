// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class GeoLocation {
  final double latitude;
  final double longitude;
  final String country; //country in the response call, may be county
  final String city; //name is the response

  GeoLocation({
    required this.latitude,
    required this.longitude,
    required this.country,
    required this.city,
  });

  // factory GeoLocation.fromJson(Map<String, dynamic> json) {
  //   try {
  //     final dataList = json['data'] as List<dynamic>;
  //     if (dataList.isNotEmpty) {
  //       final data = dataList[0] as Map<String, dynamic>;
  //       debugPrint(data.toString());
  //       return GeoLocation(
  //         latitude: data['latitude'] as double,
  //         longitude: data['longitude'] as double,
  //         city: data['label'] as String, // to be changed
  //         country: data['country'] as String,
  //       );
  //     }
  //     throw ("Is Empty");
  //   } catch (error) {
  //     debugPrint(error.toString());
  //     return GeoLocation(
  //         latitude: 0, longitude: 0, country: "Epoca", city: "Epoca");
  //   }
  // }

  factory GeoLocation.fromMultipleJson(Map<String, dynamic> json, int index) {
    try {
      final resultList = json['result'] as List<dynamic>;
      if (resultList.isNotEmpty) {
        final result = resultList[index] as Map<String, dynamic>;
        debugPrint(result.toString());
        return GeoLocation(
          latitude: result['latitude'],
          longitude: result['longitude'],
          country: result['country'],
          city: result['city'],
        );
      }
      throw Exception("Is empty");
    } catch (error) {
      debugPrint("Json $index failed because of $error");
      throw Exception("semen!");
    }
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'latitude': latitude,
  //     'longitude': longitude,
  //     'city': city,
  //     'country': country,
  //   };
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'country': country,
      'city': city,
    };
  }

  factory GeoLocation.fromMap(Map<String, dynamic> map) {
    return GeoLocation(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      country: map['country'] as String,
      city: map['city'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeoLocation.fromJson(String source) => GeoLocation.fromMap(json.decode(source) as Map<String, dynamic>);
}
