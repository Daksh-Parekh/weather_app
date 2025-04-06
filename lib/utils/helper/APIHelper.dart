import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather_app/screens/home/model/weatherModel.dart';

class ApiHelper {
  Future<WeatherDataModel?> getWeatherData(String search) async {
    String link =
        "https://api.openweathermap.org/data/2.5/weather?q=$search&appid=0a437de7c8d0dbc045e9a27093a3abcf&units=metric";

    http.Response response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      WeatherDataModel models = WeatherDataModel.mapToModel(json);

      log('$json');
      return models;
    }
    return null;
  }
}
