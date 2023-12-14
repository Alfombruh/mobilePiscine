import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:weatherappv2_proj/model/weather.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(const WeatherEmpty());

  void getWeather() async {
    /*
    call weather API, get all 3 weather dates
    change the state of the bloc to contain the weather report
    error management???
    */
    //emit(WeatherSet());
  }
}
