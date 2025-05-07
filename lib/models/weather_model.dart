import 'package:flutter/material.dart';

class WeatherModel {
  final String city;
  final DateTime date;
  final double temp;
  final String image;
  final double maxTemp;
  final double minTemp;
  final String weatherStatus;

  WeatherModel({
    required this.city,
    required this.date,
    required this.temp,
    required this.image,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStatus,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['location']['name'] as String,
      date: DateTime.parse(json['location']['localtime'] as String),
      temp: json['current']['temp_c'] as double,
      image: json['current']['condition']['icon'] as String,
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'] as double,
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'] as double,
      weatherStatus: json['current']['condition']['text'] as String,
    );
  }

  MaterialColor getThemeColor() {
    final status = weatherStatus.toLowerCase();

    if (status.contains('clear') ||
        status.contains('sunny') ||
        status.contains('partly cloudy')) {
      return Colors.orange;
    } else if (status.contains('snow') ||
        status.contains('sleet') ||
        status.contains('ice pellets') ||
        status.contains('blowing snow') ||
        status.contains('blizzard')) {
      return Colors.blue;
    } else if (status.contains('fog') ||
        status.contains('mist') ||
        status.contains('cloudy') ||
        status.contains('overcast')) {
      return Colors.blueGrey;
    } else if (status.contains('rain') ||
        status.contains('drizzle') ||
        status.contains('shower') ||
        status.contains('freezing')) {
      return Colors.blue;
    } else if (status.contains('thunder')) {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
