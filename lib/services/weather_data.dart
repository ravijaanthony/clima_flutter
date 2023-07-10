// // import 'dart:io';
// // import 'package:csv/csv.dart';
// //
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// //
// // class ReadWeatherData {
// //   final weatherList = [];
// //   // var file;
// //
// //   Future<void> readWeatherData() async {
// //     String filePath = "assets/weather/weatherData.csv";
// //     try {
// //       final file = File(filePath);
// //       if (file.existsSync()) {
// //         print("File Available");
// //       } else {
// //         print("File not available");
// //         // new File(filePath).create(recursive: true);
// //       }
// //       // final file = 'assets/weather_data.csv';
// //
// //       // readWeatherData();
// //       final csvData = await file.readAsString();
// //       final List<List<dynamic>> weatherData = CsvToListConverter().convert(csvData);
// //
// //       final List<dynamic> weatherID = weatherData[0];
// //       weatherData.removeAt(0); // Remove the header row
// //
// //       for (var i = 0; i < weatherData.length; i++) {
// //         final List<dynamic> values = weatherData[i];
// //         final weather = {
// //           weatherID[0]: int.parse(values[0]),
// //           weatherID[1]: values[1].replaceAll('"', ''),
// //           weatherID[3]: int.parse(values[3]),
// //         };
// //         weatherList.add(weather);
// //       }
// //
// // Outputting the code, day, and icon
// //   for (var weather in weatherList) {
// //     print('Code: ${weather[weatherID[0]]}');
// //     print('Day: ${weather[weatherID[1]]}');
// //     print('Icon: ${weather[weatherID[3]]}');
// //     print('\n');
// //   // }
// // } catch (e) {
// //   print("Error reading CSV file $e");
// // }
// //   }
// // }
//
// import 'dart:io';
// import 'package:csv/csv.dart';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class ReadWeatherData {
//   final weatherList = [];
//   late List<dynamic> weatherID;
//
//   Future<void> readWeatherData() async {
//     String filePath = "assets/weather/weatherData.csv";
//     try {
//       final file = File(filePath);
//       if (file.existsSync()) {
//         print("File Available");
//       } else {
//         print("File not available");
//       }
//
//       final csvData = await file.readAsString();
//       final List<List<dynamic>> weatherData = CsvToListConverter().convert(csvData);
//
//       weatherID = weatherData[0];
//       weatherData.removeAt(0); // Remove the header row
//
//       for (var i = 0; i < weatherData.length; i++) {
//         final List<dynamic> values = weatherData[i];
//         final weather = {
//           weatherID[0]: int.parse(values[0]),
//           weatherID[1]: values[1].replaceAll('"', ''),
//           weatherID[3]: int.parse(values[3]),
//         };
//         weatherList.add(weather);
//       }
//
//       // Outputting the code, day, and icon
//       for (var weather in weatherList) {
//         print('Code: ${weather[weatherID[0]]}');
//         print('Day: ${weather[weatherID[1]]}');
//         print('Icon: ${weather[weatherID[3]]}');
//         print('\n');
//       }
//     } catch (e) {
//       print("Error reading CSV file: $e");
//     }
//   }
// }
