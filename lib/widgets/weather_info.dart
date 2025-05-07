import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});
  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    String tryImage =
        weatherModel!.image.startsWith('https')
            ? weatherModel.image
            : 'https:${weatherModel.image}';
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            weatherModel.getThemeColor(),
            weatherModel.getThemeColor().shade300,
            weatherModel.getThemeColor().shade200,
            weatherModel.getThemeColor().shade50,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 130),
            Text(
              weatherModel.city,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                fontFamily: 'PoetsenOne',
              ),
            ),
            Text(
              'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: TextStyle(fontSize: 20, fontFamily: 'PoetsenOne'),
            ),
            const SizedBox(height: 32),
            Image.network(
              tryImage,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.image_not_supported_outlined,
                  size: 100,
                );
              },
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'H: ${weatherModel.maxTemp.toInt()}°',
                  style: TextStyle(fontSize: 25, fontFamily: 'Pacifico'),
                ),
                Text(
                  '${weatherModel.temp.toInt()}°',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                    fontFamily: 'PoetsenOne',
                  ),
                ),

                Text(
                  'L: ${weatherModel.minTemp.toInt()}°',
                  style: TextStyle(fontSize: 25, fontFamily: 'Pacifico'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              weatherModel.weatherStatus,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                fontFamily: 'Pacifico',
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
