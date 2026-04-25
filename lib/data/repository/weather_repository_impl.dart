import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/data/remote_data_source/remote_data_source.dart';
import 'package:weather_app/domain/base_repository/base_repository.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';

class WeatherRepositoryImpl implements BaseWeatherRepository {
  final BaseRemoteDataSource baseRemoteDataSource;

  WeatherRepositoryImpl({required this.baseRemoteDataSource});

  @override
  Future<WeatherEntity> getWeatherByCityName(String cityName) async {
    WeatherModel weatherModel = await baseRemoteDataSource.getWeatherByCityName(
      cityName,
    );
    WeatherEntity weatherEntity = weatherModel.toEntity();
    return weatherEntity;
  }
}
