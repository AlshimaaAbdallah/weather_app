import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);
  final String baseUrl = "https://api.weatherapi.com/v1/";
  final String apiKey = "d2584ea26888455ebe5112920261501";

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      final Response response = await dio.get(
        "$baseUrl/forecast.json?key=$apiKey&q=$cityName",
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
