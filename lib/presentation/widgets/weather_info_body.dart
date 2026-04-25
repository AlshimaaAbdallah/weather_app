import 'package:flutter/material.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';
import 'package:weather_app/presentation/widgets/get_theme_color.dart';
import 'package:weather_app/presentation/widgets/weather_image.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherEntity});
  final WeatherEntity weatherEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            GetThemeColor().getThemeColor(
              weatherCondotion: weatherEntity.weatherCondition,
            ),
            GetThemeColor().getThemeColor(
              weatherCondotion: weatherEntity.weatherCondition,
            )[300]!,
            // دي material colour عشان كده استخدمنا معاها ال []
            GetThemeColor().getThemeColor(
              weatherCondotion: weatherEntity.weatherCondition,
            )[50]!,
            //كان ممكن نستخدم دي بردو ونغير القيم من 1الي 0
            // Theme.of(context).primaryColor.withValues(alpha: 1),
            // Theme.of(context).primaryColor.withValues(alpha: 0.5),
            // Theme.of(context).primaryColor.withValues(alpha: 0),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherEntity.cityName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            const SizedBox(height: 32),
            Text(
              "Updated at ${weatherEntity.date.hour}: ${weatherEntity.date.minute}",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WeatherImage(imageUrl: weatherEntity.image),
                Text(
                  weatherEntity.temp.round().toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                Column(
                  children: [
                    Text(
                      'Maxtemp: ${weatherEntity.maxTemp.round()}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Mintemp: ${weatherEntity.minTemp.round()}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              weatherEntity.weatherCondition,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}
