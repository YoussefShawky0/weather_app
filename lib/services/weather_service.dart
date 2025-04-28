import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherService {
  final String apiKey = dotenv.env['API_KEY'] ?? '';
  final String baseUrl ='https://api.weatherapi.com/v1';
  final Dio dio = Dio();
  Future<WeatherModel> getCurrentWeather({required String city}) async {

  try {
  Response response = await dio.get(
    '$baseUrl/forecast.json?key=$apiKey&q=$city&days=1',
  );
  WeatherModel weatherModel = WeatherModel.fromJson(response.data);
  return weatherModel;

} on DioException catch (e) {
  final errorMessage = e.response?.data['error']['message'] ?? 'Unknown error';
  throw Exception('Failed to load weather data: $errorMessage');
}
  }
}