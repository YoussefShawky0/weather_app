import 'package:flutter/material.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/widgets/no_weather_info.dart';
import 'package:weather_app/widgets/weather_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    weatherModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 47, 82, 110),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Weather App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: weatherModel == null ? const NoWeatherInfo() : const WeatherInfo(),
    );
  }
}
