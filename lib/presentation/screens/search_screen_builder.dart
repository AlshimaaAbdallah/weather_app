// import 'package:flutter/material.dart';
// import 'package:weather_app/data/models/weather_model.dart';
// import 'package:weather_app/services/weather_service.dart';
// import 'package:weather_app/widgets/snapshot_has_error.dart';
// import 'package:weather_app/widgets/weather_info_body.dart';

// class SearchScreenBuilder extends StatefulWidget {
//   const SearchScreenBuilder({super.key, required this.cityName});
//   final String cityName;
//   @override
//   State<SearchScreenBuilder> createState() => _SearchScreenBuilderState();
// }

// class _SearchScreenBuilderState extends State<SearchScreenBuilder> {
//   late final Future<WeatherModel> futureWeather;
//   @override
//   void initState() {
//     futureWeather = WeatherService.getWeather(cityName: widget.cityName);
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
