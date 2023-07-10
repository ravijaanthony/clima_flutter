import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final url;

  Future getData() async {
    try {
      print("Waiting for response ...");
      http.Response response = await http.get(url); // Error on response

      print(response.statusCode);
      print(response.body);

      print("Got a response!");

      if (response.statusCode == 200) {
        String data = response.body;
        print(data);

        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        print(response.statusCode);
      }
      // Rest of the code to handle the response
    } catch (e) {
      print('Error --> $e');
    }
  }
}
