import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //provide cubit for materialApp عشان ال homeView,searchview يقدروا يشوفوه
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, WeatherState>(
        //ده عشان اقدر اغير ال theme يعني بغير ال state بتاعة ال material app لان هي اللي بيتغير فيها الثيم ودي خطوة لها علاقة بالثيم مش البلوك وانشاؤه
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              useMaterial3: false,
              primarySwatch: getThemeColor(
                c: BlocProvider.of<GetWeatherCubit>(
                  context,
                ).weatherModel?.weatherCondition,
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: HomeView(),
          );
        },
      ),
    );
  }
}

MaterialColor getThemeColor({required String? c}) {
  if (c == null) return Colors.blue;
  final condition = c.toLowerCase();

  if (condition.contains('sunny') || condition.contains('clear')) {
    return Colors.orange;
  }

  if (condition.contains('cloud')) {
    return Colors.blueGrey;
  }

  if (condition.contains('fog') || condition.contains('mist')) {
    return Colors.grey;
  }

  if (condition.contains('rain') ||
      condition.contains('drizzle') ||
      condition.contains('shower')) {
    return Colors.indigo;
  }

  if (condition.contains('snow') ||
      condition.contains('sleet') ||
      condition.contains('ice')) {
    return Colors.lightBlue;
  }

  if (condition.contains('thunder')) {
    return Colors.deepPurple;
  }

  return Colors.blue; // default
}
