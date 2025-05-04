import 'package:flutter/material.dart';

class NoWeatherInfo extends StatelessWidget {
  const NoWeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'There is no weather data available,\n Search for a city🔍',
        style: TextStyle(
          fontSize: 24,
          color: Colors.blue[900],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
