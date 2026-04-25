import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';
import 'package:weather_app/domain/use_cases/get_weather_by_city_name.dart';
import 'package:weather_app/presentation/controllers/cubits/get_weather_cubit/get_weather_cubit_states.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  final GetWeatherByCityName getWeatherByCityName;
  GetWeatherCubit({required this.getWeatherByCityName})
    : super(InitialWeatherState());
  getWeather(String cityName) async {
    try {
      WeatherEntity weatherEntity = await getWeatherByCityName.execute(
        cityName,
      );
      emit(WeatherLoadedState(weatherEntity: weatherEntity));
    } catch (e) {
      emit(WeatherFailureState(errorMessage: e.toString()));
    }
  }
}
