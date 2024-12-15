import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_page/model/weather_model.dart';
import 'package:weather_app/utils/helper/api_helper.dart';

class HomeProvider with ChangeNotifier {
  List<WeatherListModel> weatherList = [];
  WeatherDataModel? weatherModel = WeatherDataModel();

  Future<void> WeatherData(String search) async {
    ApiHelper helper = ApiHelper();
    weatherModel = await helper.getWeatherData(search);

    weatherList = weatherModel?.weathers ?? [];
    log('${weatherList}');
    notifyListeners();
  }

  List<WeatherListModel> bookMark = [];
  void addWeatherBookMark(WeatherListModel? m1) {
    bookMark.add(m1!);

    // m1!.weathers,
    // {"d": m1?.countryName, 'ma': m1?.mainModels?.grndLevel},
    // );
    log('${bookMark}');
    notifyListeners();
  }
}
