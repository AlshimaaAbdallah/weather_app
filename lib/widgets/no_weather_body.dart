import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('there is no weather 😔', style: TextStyle(fontSize: 25)),
          Text('start searching now 🔍', style: TextStyle(fontSize: 25)),
        ],
      ),
    );
  }
}
