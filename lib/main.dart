import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/remote_data_source/remote_data_source.dart';
import 'package:weather_app/data/repository/weather_repository_impl.dart';
import 'package:weather_app/domain/base_repository/base_repository.dart';
import 'package:weather_app/domain/use_cases/get_weather_by_city_name.dart';
import 'package:weather_app/presentation/controllers/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/presentation/controllers/cubits/get_weather_cubit/get_weather_cubit_states.dart';
import 'package:weather_app/presentation/screens/home_screen.dart';
import 'package:weather_app/presentation/widgets/get_theme_color.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        BaseRemoteDataSource baseRemoteDataSource = RemoteDataSource();
        BaseWeatherRepository baseWeatherRepository = WeatherRepositoryImpl(
          baseRemoteDataSource: baseRemoteDataSource,
        );
        GetWeatherByCityName getWeatherByCityName = GetWeatherByCityName(
          baseRepository: baseWeatherRepository,
        );
        return GetWeatherCubit(getWeatherByCityName: getWeatherByCityName);
      },
      child: BlocBuilder<GetWeatherCubit, WeatherState>(
        //ده عشان اقدر اغير ال theme يعني بغير ال state بتاعة ال material app لان هي اللي بيتغير فيها الثيم ودي خطوة لها علاقة بالثيم مش البلوك وانشاؤه
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              useMaterial3: false,
              primarySwatch: GetThemeColor().getThemeColor(
                weatherCondotion: (state is WeatherLoadedState)
                    ? state.weatherEntity.weatherCondition
                    : null,
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
