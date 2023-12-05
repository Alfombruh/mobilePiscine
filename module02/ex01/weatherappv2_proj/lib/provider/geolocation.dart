import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:weatherappv2_proj/const/const.dart';

class GeolocationProvider {
  Future<Map<String, dynamic>> getGeoLocation(
      double latitude, double longitude) async {
    try {
      var api =
          "$RGEOLOCATION_API_PATH?access_key=$RGEOLOCATION_API_KEY&query=${latitude.toString()},${longitude.toString()}";
      debugPrint(api);
      final res = await http.get(Uri.parse(api));
      if (res.statusCode == 200) {
        return json.decode(res.body);
      }
      debugPrint(res.statusCode.toString());
      throw Exception("Couldn't fetch geolocation");
    } catch (error) {
      debugPrint(error.toString());
      throw ("GeoLocation provider exception");
    }
  }
}
