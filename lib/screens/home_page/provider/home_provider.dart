import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_page/model/weather_model.dart';
import 'package:weather_app/utils/helper/api_helper.dart';
import 'package:weather_app/utils/helper/shr_helper.dart';

class HomeProvider with ChangeNotifier {
  List<WeatherListModel> weatherList = [];
  WeatherDataModel? weatherModel = WeatherDataModel();

  List<WeatherDataModel> bookMark = [];

  int weatherBookmarkInx = 0;

  Future<void> weatherData(String search) async {
    ApiHelper helper = ApiHelper();
    weatherModel = await helper.getWeatherData(search);

    weatherList = weatherModel?.weathers ?? [];
    log('$weatherList');
    notifyListeners();
  }

  void addWeatherBookMark(WeatherDataModel? m1) {
    bookMark.add(m1!);
    ShrHelper helper = ShrHelper();
    helper.saveWeatherCity(bookMark);
    log('$bookMark');
    notifyListeners();
  }

  Future<void> getWeatherData() async {
    ShrHelper helper = ShrHelper();
    bookMark = await helper.getWeatherCity();
    notifyListeners();
  }

  void setWeatherBookmarkIndex(int inx) {
    weatherBookmarkInx = inx;
    notifyListeners();
  }
}
