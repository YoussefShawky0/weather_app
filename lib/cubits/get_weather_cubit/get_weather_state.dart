import 'package:weather_app/models/weather_model.dart';

class WeatherState {
  
}

class NoWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;
  
  WeatherLoadedState(this.weatherModel);
}

class WeatherErrorState extends WeatherState {
  final String errorMessage;

  WeatherErrorState({this.errorMessage = 'Something went wrong!'});
}