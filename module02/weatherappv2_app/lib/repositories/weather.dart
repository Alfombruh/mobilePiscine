import 'package:flutter/material.dart';
import 'package:weatherappv2_proj/model/weather.dart';

class WeatherRepository {
  Future<CurrentWeather> getCurrentWeather(
      double lat, double long, double elevation) {
    try {
      // ignore: prefer_typing_uninitialized_variables
      var res; //call provider here;
      return res;
    } catch (error) {
      debugPrint("WeatherRepository getTodayWeather error()=> $error");
      throw ("TodayWeather fetch error");
    }
  }

  //getTodayWeather

  //getWeeklyWeather
  
}
