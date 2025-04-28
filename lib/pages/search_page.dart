import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart'; // Add this import

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
        backgroundColor: const Color.fromARGB(255, 47, 82, 110),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 170), // Add some spacing
              SvgPicture.asset(
                'assets/world.svg',
                height: 200,
                width: 200,
                alignment: Alignment.center,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  const Color.fromARGB(255, 47, 82, 110),
                  BlendMode.srcATop,
                ), // // Adjust the color filter as needed
              ),
              const SizedBox(height: 40),
              // Add some spacing
              TextField(
                onSubmitted: (value) async {
                    weatherModel = await WeatherService()
                      .getCurrentWeather(city: value);
                  Navigator.pop(context);
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  labelText: 'Search',
                  labelStyle: TextStyle(color: Colors.grey[600], fontSize: 18),
                  hintText: 'Enter city name',
                  hintStyle: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 47, 82, 110),
                      width: 2,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

WeatherModel? weatherModel;