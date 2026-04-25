import 'package:weather_app/domain/base_repository/base_repository.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';

class GetWeatherByCityName {
  GetWeatherByCityName({required this.baseRepository});
  final BaseWeatherRepository baseRepository;

  Future<WeatherEntity> execute(String cityName) async {
    return await baseRepository.getWeatherByCityName(cityName);
  }
}
