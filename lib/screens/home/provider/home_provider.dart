import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/screens/home/model/weather_model.dart';
import 'package:weather_app/utils/helper/api_helper.dart';
import 'package:weather_app/utils/helper/shr_helper.dart';

class HomeProvider with ChangeNotifier {
  List<WeatherListModel> weatherList = [];
  WeatherDataModel? weatherModel = WeatherDataModel();
  List<WeatherDataModel> bookMark = [];
  String? searchedCity;

  Future<void> initMethod() async {
    await getWeatherData();
    if (searchedCity != null) {
      await weatherData(searchedCity);
    }
  }

  Future<void> weatherData(String? city) async {
    ApiHelper helper = ApiHelper();

    weatherModel = await helper.getWeatherData(city ?? '');
    weatherList = weatherModel?.weathers ?? [];
    log('$weatherList');
    notifyListeners();
  }

  // Future<void> searchCity(String? city) async {
  //   ApiHelper helper = ApiHelper();
  //   // searchedCity = city;
  //   searchWeatherModel = await helper.getWeatherData(city ?? '');
  //   weatherList = weatherModel?.weathers ?? [];
  //   log('City searched: $searchedCity');
  //   notifyListeners();
  // }

  Future<void> addWeatherBookMark(WeatherDataModel? m1, String? city) async {
    bookMark.add(m1!);
    searchedCity = city;
    ShrHelper helper = ShrHelper();
    helper.setBookmarkedCity(city!);
    print('========================$searchedCity');
    await weatherData(searchedCity);
    log('$bookMark');
    notifyListeners();
  }

  Future<void> getWeatherData() async {
    ShrHelper helper = ShrHelper();
    searchedCity = await helper.getBookmarkedCity();
    notifyListeners();
  }
}
