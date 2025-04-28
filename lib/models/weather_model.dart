class WeatherModel {
  final String city;
  final String date;
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
      date: json['current']['last_updated'] as String,
      temp: json['current']['temp_c'] as double,
      image: json['current']['condition']['icon'] as String,
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'] as double,
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'] as double,
      weatherStatus:
          json['forecast']['forecastday'][0]['day']['condition']['text']
              as String,
    );
  }
}
