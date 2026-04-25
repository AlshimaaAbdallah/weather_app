import 'package:flutter/material.dart';

class GetThemeColor {
  MaterialColor getThemeColor({required String? weatherCondotion}) {
    if (weatherCondotion == null) return Colors.blue;
    final condition = weatherCondotion.toLowerCase();

    if (condition.contains('sunny') || condition.contains('clear')) {
      return Colors.lightBlue;
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
      return Colors.blueGrey;
    }

    if (condition.contains('thunder')) {
      return Colors.deepPurple;
    }

    return Colors.blue; // default
  }
}
