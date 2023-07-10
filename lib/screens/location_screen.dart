import 'package:clima_flutter/services/weather.dart';
import 'package:clima_flutter/services/weather_data.dart';
import 'package:flutter/material.dart';

import '../fileReading.dart';
import '../utilities/constants.dart';
// import 'package:clima_flutter/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  // getWeatherIcon

  late int temperature;
  late Object? weatherIcon;
  late String cityName;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    // var weatherDescription = weatherData['current']['condition']['text'];
    double temp = weatherData['current']['temp_c'];
    temperature = temp.toInt();
    cityName = weatherData['location']['region'];
    var conditionNumber = weatherData['current']['condition']['code'];
    print("conditionNumber: " + conditionNumber.toString()); // --> FOR DEBUG
    weatherIcon = weatherModel.getWeatherIcon(conditionNumber, 0);

    print("Reading WeatherData");

    // WeatherModel weatherModel = WeatherModel();
    weatherModel.readingWeatherData();

    // ReadWeatherData readWeatherData = ReadWeatherData();
    // FileReadingWeatherData readingWeatherData = FileReadingWeatherData();
    // readingWeatherData.csvDataList;
    // readWeatherData.readWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/location_background.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
        )),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°C',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon.toString(),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "It's 🍦 time in San Francisco!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
