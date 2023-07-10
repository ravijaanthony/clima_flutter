import 'package:clima_flutter/fileReading.dart';
import 'package:clima_flutter/services/weather_data.dart';
import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

class WeatherModel {
  // WeatherModel(this.weatherCode, {required weatherCode, required weatherStatus, required weatherIcon});
  int? weatherCode;
  String? weatherStatus;
  int? weatherIcon;

  FileReadingWeatherData fileReadingWeatherData = FileReadingWeatherData();
  // for (file in fileReadingWeatherData.csvDataList)

  // ReadWeatherData readWeatherData = ReadWeatherData();
  var weather;

  void readingWeatherData() {
    for (weather in fileReadingWeatherData.csvDataList) {
      weatherCode = weather['code'];
      weatherStatus = weather['day'];
      weatherIcon = weather['icon'];
      // return (weatherCode,weatherStatus, weatherIcon);
    }
    // readWeatherData.
  }

  Object? getWeatherIcon(int condition, int weatherCode) {
    print('Weather: ');
    // print(readWeatherData.weatherList);
    // readingWeatherData(weatherCode)
    // print(weather);
    print('weatherCode: ' + weatherCode.toString());

    if (condition == weatherCode) {
      // return '$weatherIcon.png';
      // print('weatherCode: ' + weatherCode.toString()); // --> TO DEBUG
      return weatherCode;
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
