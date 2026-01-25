// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:my_weather_app/models/weather_model.dart';
// import 'package:my_weather_app/services/weather_service.dart';
// import 'package:my_weather_app/widgets/snapshot_has_error.dart';
// import 'package:my_weather_app/widgets/weather_info_body.dart';

// class SearchViewBuilder extends StatefulWidget {
//   const SearchViewBuilder({super.key, required this.cityName});
//   final String cityName;
//   @override
//   State<SearchViewBuilder> createState() => _SearchViewBuilderState();
// }

// class _SearchViewBuilderState extends State<SearchViewBuilder> {
//   late final Future<WeatherModel> futureWeather;
//   @override
//   void initState() {
//     futureWeather = WeatherService(Dio()).getWeather(cityName: widget.cityName);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: futureWeather,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return WeatherInfoBody(weatherModel: snapshot.data!);
//         } else if (snapshot.hasError) {
//           return SnapshotHasError();
//         } else {
//           return CircularProgressIndicator();
//         }
//       },
//     );
//   }
// }
