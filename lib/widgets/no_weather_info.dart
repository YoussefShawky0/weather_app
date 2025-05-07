import 'package:flutter/material.dart';

class NoWeatherInfo extends StatelessWidget {
  const NoWeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.cloud_off, size: 100, color: Colors.white),
              const SizedBox(height: 20),
              const Text(
                'No Weather Data',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PoetsenOne',
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Search for a city to get the latest weather update 🔍',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
