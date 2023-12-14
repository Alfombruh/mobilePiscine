import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weatherappv2_proj/const/const.dart';

class WeatherProvider {
  //GetCurrentWeather
  Future<Map<String, dynamic>> getCurrentWeather(
      double lat, double long, double elevation) async {
    try {
      final res = await http.get(Uri.parse(
          "$WEATHER_API_PATH?latitude=$lat&longitude=$long&elevation=$elevation"));
      if (res.statusCode == 200) {
        return json.decode(res.body);
      }
      throw ("WeatherProviderCurrent res.statusCode == ${res.statusCode}");
    } catch (error) {
      debugPrint("WeatherProviderCurrent error ()=>$error");
      throw ("WeatherProviderCurrent error ($error)");
    }
  }

  //GetTodayWeather
  Future<Map<String, dynamic>> getTodayWeather(
      double lat, double long, double elevation) async {
    try {
      final res = await http.get(Uri.parse(
          "$WEATHER_API_PATH?latitutde$lat&longitude=$long&elevation$elevation"));
      if (res.statusCode == 200) {
        return json.decode(res.body);
      }
      throw ("WeatherProviderToday res.statusCode == ${res.statusCode}");
    } catch (error) {
      debugPrint("WeatherProviderToday error ()=>$error");
      throw ("WeatherProviderToday error ($error)");
    }
  }

  //GetWeeklyWeather
  Future<Map<String, dynamic>> getWeeklyWeather(
      double lat, double long, double elevation) async {
    try {
      final res = await http.get(Uri.parse(
          "$WEATHER_API_PATH?latitude=$lat&longitude=$long&elevation=$elevation"));
      if (res.statusCode == 200) {
        return json.decode(res.body);
      }
      throw ("WeatherProviderWeekly res.statusCode = ${res.statusCode}");
    } catch (error) {
      debugPrint("WeatherProviderWeekly error()=>$error");
      throw ("WeatherProviderWeekly error ($error)");
    }
  }
}
