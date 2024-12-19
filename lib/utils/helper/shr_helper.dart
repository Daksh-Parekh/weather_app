import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/screens/home_page/model/weather_model.dart';

class ShrHelper {
  Future<void> saveWeatherCity(List<WeatherDataModel> bookMarkList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? bookMarkStringList = bookMarkList
        .map(
          (e) => jsonEncode(e.mainModels),
        )
        .toList();
    log('$bookMarkStringList===============================');
    await prefs.setStringList('bookMark', bookMarkStringList);
  }

  Future<List<WeatherDataModel>> getWeatherCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<dynamic>? bookMarkStringList = prefs.getStringList('bookMark') ?? [];
    log('$bookMarkStringList');

    return bookMarkStringList
        .map(
          (e) => WeatherDataModel.mapToModel(jsonDecode(e)),
        )
        .toList();
  }
}
