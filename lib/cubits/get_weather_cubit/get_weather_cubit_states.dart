class WeatherState {}

class InitialWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  WeatherLoadedState();
}

class WeatherFailureState extends WeatherState {
  WeatherFailureState({required this.errorMessage});
  final String errorMessage;
}
