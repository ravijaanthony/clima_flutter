import 'dart:convert';
import 'package:clima_flutter/screens/location_screen.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

const _apiKey = 'ad592558e08b4e368f4114239230707';
String q = '';
late String baseUrl = '';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  //
  final int _days = 1;
  final String _aqi = 'no';
  final String _alerts = 'no';
  // https://api.weatherapi.com/v1/forecast.json?key=1ca361b9112743e7885131542230507&q=London&days=1&aqi=no&alerts=no

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    // Request permission from the user to access their location.
    await Geolocator.requestPermission();

    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    print(latitude);
    print(longitude);

    // q = '$latitude,$longitude';

    // baseUrl = 'https://api.openweathermap.org/data/3.0/onecall?lat={$latitude}&lon={$longitude}&appid={$_apiKey}';

    // baseUrl = 'http://api.weatherapi.com/v1/forecast.json';

    // var uri = Uri.https('example.org', '/path', {'q': 'dart'});
    // print(uri); // https://example.org/path?q=dart
    // https://api.openweathermap.org/data/3.0/onecall?lat={lat}&lon={lon}&appid={API key}
    // String url = '$baseUrl?lat={$latitude}&lon={$longitude}&appid={$_apiKey}';
    // String url = 'baseUrl?key=$_apiKey,q=london';
    // print(url);

    Uri uri = Uri.https('api.weatherapi.com', '/v1/forecast.json', {'key': '$_apiKey', 'q': '$latitude,$longitude'});
    print(uri);
    NetworkHelper networkHelper = NetworkHelper(uri);

    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));

    http: //api.weatherapi.com/v1/forecast.json
    // print('hi');
    print(uri);
    // http.Response response = await http.get(uri); // Error!

    // try {
    //   print("Waiting for response ...");
    //   http.Response response = await http.get(uri); // Error on response
    //
    //   print(response.statusCode);
    //   print(response.body);
    //
    //   print("Got a response!");
    //
    //   if (response.statusCode == 200) {
    //     String data = response.body;
    //     print(data);
    //
    //     var decodedData = jsonDecode(data);

    //   } else {
    //     print(response.statusCode);
    //   }
    //   // Rest of the code to handle the response
    // } catch (e) {
    //   print('Error --> $e');
    // }

    // print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.blueAccent,
          size: 100,
        ),
      ),
    );
  }
}
