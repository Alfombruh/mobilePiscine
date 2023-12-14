part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {
  final CurrentWeather? current;
  final TodayWeather? today;
  final WeeklyWeather? weekly;

  const WeatherState({this.current, this.today, this.weekly});
}

final class WeatherEmpty extends WeatherState {
  const WeatherEmpty();
}

final class WeatherSet extends WeatherState {
  const WeatherSet(
      CurrentWeather current, TodayWeather today, WeeklyWeather weekly)
      : super(current: current, today: today, weekly: weekly);
}
