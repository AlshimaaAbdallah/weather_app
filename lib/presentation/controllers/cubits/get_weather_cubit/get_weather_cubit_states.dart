import 'package:weather_app/domain/entities/weather_entity.dart';

class WeatherState {}

class InitialWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherEntity weatherEntity;
  WeatherLoadedState({required this.weatherEntity});
}

class WeatherFailureState extends WeatherState {
  WeatherFailureState({required this.errorMessage});
  final String errorMessage;
}
