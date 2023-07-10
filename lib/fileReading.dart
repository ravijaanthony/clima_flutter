// // import 'package:flutter/material.dart';
// // import 'dart:convert';
// // import 'package:flutter/services.dart' show rootBundle;
// //
// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter framework is initialized
// //
// //   await loadCSV().then((csvDataList) {
// //     for (var row in csvDataList) {
// //       print('Code: ${row[0]}');
// //       print('Day: ${row[1]}');
// //       print('Icon: ${row[3]}');
// //       print('\n');
// //     }
// //
// //     runApp(MaterialApp(home: CSVReader(csvDataList: csvDataList)));
// //   }).catchError((e) {
// //     print('Error reading CSV file: $e');
// //   });
// // }
// //
// // Future<List<List<dynamic>>> loadCSV() async {
// //   try {
// //     String csvData = await rootBundle.loadString('assets/weather/weatherData.csv');
// //     List<String> csvList = LineSplitter().convert(csvData);
// //
// //     List<List<dynamic>> csvDataList = [];
// //
// //     for (var i = 0; i < csvList.length; i++) {
// //       List<dynamic> row = csvList[i].split(',');
// //       csvDataList.add(row);
// //     }
// //
// //     return csvDataList;
// //   } catch (e) {
// //     throw Exception('Error reading CSV file: $e');
// //   }
// // }
// //
// // class CSVReader extends StatelessWidget {
// //   final List<List<dynamic>> csvDataList;
// //
// //   const CSVReader({required this.csvDataList});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('CSV Reader'),
// //       ),
// //       body: ListView.builder(
// //         itemCount: csvDataList.length,
// //         itemBuilder: (context, index) {
// //           List<dynamic> row = csvDataList[index];
// //           return ListTile(
// //             title: Text(row[0]),
// //             subtitle: Text('${row[1]}, ${row[3]}'),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:flutter/services.dart' show rootBundle;
// import 'dart:developer' as developer;
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter framework is initialized
//
//   developer.log('Initializing CSV reader...', name: '.');
//
//   await loadCSV().then((csvDataList) {
//     for (var row in csvDataList) {
//       developer.log('Code: ${row[0]}', name: '.');
//       developer.log('Day: ${row[1]}', name: '.');
//       developer.log('Icon: ${row[3]}', name: '.');
//       developer.log('\n', name: '.');
//     }
//
//     runApp(MaterialApp(home: CSVReader(csvDataList: csvDataList)));
//   }).catchError((e) {
//     developer.log('Error reading CSV file: $e', name: '.');
//   });
// }
//
// Future<List<List<dynamic>>> loadCSV() async {
//   try {
//     String csvData = await rootBundle.loadString('assets/weather/weatherData.csv');
//     List<String> csvList = LineSplitter().convert(csvData);
//
//     List<List<dynamic>> csvDataList = [];
//
//     for (var i = 0; i < csvList.length; i++) {
//       List<dynamic> row = csvList[i].split(',');
//       csvDataList.add(row);
//     }
//
//     return csvDataList;
//   } catch (e) {
//     throw Exception('Error reading CSV file: $e');
//   }
// }
//
// class CSVReader extends StatelessWidget {
//   final List<List<dynamic>> csvDataList;
//
//   const CSVReader({required this.csvDataList});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('CSV Reader\n'),
//       ),
//       body: ListView.builder(
//         itemCount: csvDataList.length,
//         itemBuilder: (context, index) {
//           List<dynamic> row = csvDataList[index];
//           return ListTile(
//             title: Text(row[0]),
//             subtitle: Text('${row[1]}, ${row[3]}'),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter framework is initialized

  await loadCSV().then((csvDataList) {
    for (var row in csvDataList) {
      print('Code: ${row[0]}');
      print('Day: ${row[1]}');
      print('Icon: ${row[3]}');
      print('\n');
    }

    runApp(MaterialApp(home: CSVReader(csvDataList: csvDataList)));
  }).catchError((e) {
    print('Error reading CSV file: $e');
  });
}

Future<List<List<dynamic>>> loadCSV() async {
  try {
    String csvData = await rootBundle.loadString('assets/weather/weatherData.csv');
    List<String> csvList = LineSplitter().convert(csvData);

    List<List<dynamic>> csvDataList = [];

    for (var i = 0; i < csvList.length; i++) {
      List<dynamic> row = csvList[i].split(',');
      csvDataList.add(row);
    }

    return csvDataList;
  } catch (e) {
    throw Exception('Error reading CSV file: $e');
  }
}

class CSVReader extends StatelessWidget {
  final List<List<dynamic>> csvDataList;

  const CSVReader({required this.csvDataList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CSV Reader'),
      ),
      body: ListView.builder(
        itemCount: csvDataList.length,
        itemBuilder: (context, index) {
          List<dynamic> row = csvDataList[index];
          return ListTile(
            title: Text(row[0]),
            subtitle: Text('${row[1]}, ${row[3]}'),
          );
        },
      ),
    );
  }
}
