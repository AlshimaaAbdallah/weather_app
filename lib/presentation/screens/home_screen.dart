import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/controllers/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/presentation/controllers/cubits/get_weather_cubit/get_weather_cubit_states.dart';
import 'package:weather_app/presentation/screens/search_screen.dart';
import 'package:weather_app/presentation/widgets/no_weather_body.dart';
import 'package:weather_app/presentation/widgets/weather_info_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            icon: Icon(Icons.search, size: 28),

            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SearchScreen();
                  },
                ),
              );
              setState(() {});
            },
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is InitialWeatherState) {
            return NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(weatherEntity: state.weatherEntity);
          } else {
            return Center(
              child: const Text(
                "Error<Try later",
                style: TextStyle(fontSize: 40, color: Colors.red),
              ),
            );
          }
        },
      ),
    );
  }
}
