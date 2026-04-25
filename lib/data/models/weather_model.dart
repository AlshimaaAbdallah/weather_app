import 'package:weather_app/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required super.cityName,
    required super.date,
    required super.image,
    required super.temp,
    required super.maxTemp,
    required super.minTemp,
    required super.weatherCondition,
  });
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json["location"]["name"],
      date: DateTime.parse(json["current"]["last_updated"]),
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      weatherCondition:
          json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
    );
  }

  WeatherEntity toEntity() {
    return WeatherEntity(
      cityName: cityName,
      date: date,
      image: image,
      temp: temp,
      maxTemp: maxTemp,
      minTemp: minTemp,
      weatherCondition: weatherCondition,
    );
  }
}
