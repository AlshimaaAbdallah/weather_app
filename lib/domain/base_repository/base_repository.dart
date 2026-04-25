import 'package:weather_app/domain/entities/weather_entity.dart';

abstract class BaseWeatherRepository {
  Future<WeatherEntity> getWeatherByCityName(String cityName);
}
