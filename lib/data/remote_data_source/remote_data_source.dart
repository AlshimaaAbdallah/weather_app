import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/core/constants/constants.dart';
import 'package:weather_app/data/models/weather_model.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel> getWeatherByCityName(String cityName);
}

class RemoteDataSource implements BaseRemoteDataSource {
  Dio dio = Dio();
  @override
  Future<WeatherModel> getWeatherByCityName(String cityName) async {
    try {
      final Response response = await dio.get(
        "${Constants.baseUrl}/forecast.json?key=${Constants.apiKey}&q=$cityName",
      );
      WeatherModel currentWeather = WeatherModel.fromJson(response.data);
      return currentWeather;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data["error"]["message"] ?? "Oops! Error\n   Try later";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("Oops! Error\n   Try later");
    }
  }
}
