import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Search City',
          style: TextStyle(
            fontFamily: 'PoetsenOne',
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueGrey,
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
                  const Color.fromARGB(255, 255, 255, 255),
                  BlendMode.srcATop,
                  // Adjust the opacity as needed
                ), // // Adjust the color filter as needed
              ),
              const SizedBox(height: 50),
              Text(
                'Find Weather by City Name',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[300],
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              // Add some spacing
              TextField(
                controller: controller,
                style: const TextStyle(color: Colors.white, fontSize: 18),
                onSubmitted: (cityName) {
                  var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(
                    context,
                  );
                  getWeatherCubit.getWeather(cityName: cityName);
                  Navigator.pop(context);
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  labelText: 'Search',
                  labelStyle: TextStyle(
                    color: const Color.fromARGB(255, 219, 205, 205),
                    fontSize: 18,
                  ),
                  hintText: 'Enter city name',
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(255, 219, 205, 205),
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    onPressed: () {
                      final cityName = controller.text.trim();
                      if (cityName.isEmpty) return;
                      BlocProvider.of<GetWeatherCubit>(
                        context,
                      ).getWeather(cityName: cityName);
                      Navigator.pop(context);
                    },
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
