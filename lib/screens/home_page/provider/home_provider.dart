import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_page/model/weather_model.dart';
import 'package:weather_app/utils/helper/api_helper.dart';

class HomeProvider with ChangeNotifier {
  List<WeatherListModel> weatherList = [];
  WeatherDataModel? weatherModel = WeatherDataModel();
  Future<void> WeatherData() async {
    ApiHelper helper = ApiHelper();
    weatherModel = await helper.getWeatherData();

    weatherList = weatherModel!.weathers!;
    log('${weatherList}');
    notifyListeners();
  }
}
