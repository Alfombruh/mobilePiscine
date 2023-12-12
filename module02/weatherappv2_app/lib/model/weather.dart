import 'dart:ffi';

abstract class Weather {
  Weather(this.day, 
      {required this.temperature,
      required this.weatherDescription,
      required this.windSpeed});

  final double temperature;
  final String weatherDescription;
  final double windSpeed;
  final UnsignedInt? day;
}

class CurrentWeather {
  CurrentWeather(this.current);

  final Weather current;
}

class TodayWeather {
  TodayWeather(this.hours);

  final List<Weather> hours;
}

class WeeklyWeather {
  WeeklyWeather(this.days);

  final List<Weather> days;
}
