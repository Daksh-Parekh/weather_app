import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/screens/home/model/weather_model.dart';
import 'package:weather_app/utils/helper/api_helper.dart';
import 'package:weather_app/utils/helper/shr_helper.dart';

class HomeProvider with ChangeNotifier {
  List<WeatherListModel> weatherList = [];
  List<WeatherListModel> searchWeatherList = [];
  WeatherDataModel? weatherModel = WeatherDataModel();
  WeatherDataModel? searchWeatherModel;
  List<WeatherDataModel> bookMark = [];
  String? searchedCity;
  int arcInidicator = (DateTime.now().hour % 12) * 10;
  String? searchedIcons;

  Future<void> initMethod() async {
    await getWeatherData();

    if (searchedCity != null) {
      await weatherData();
    }
  }

  Future<void> weatherData() async {
    ApiHelper helper = ApiHelper();
    weatherModel = await helper.getWeatherData(searchedCity!);

    weatherList = weatherModel?.weathers ?? [];

    searchedIcons = weatherList.first.iconCode;
    iconPath = searchIcons(searchedIcons ?? '');
    log('$weatherList');
    notifyListeners();
  }

  String? iconPath;
  Future<void> searchesData(String? city) async {
    ApiHelper helper = ApiHelper();
    searchWeatherModel = await helper.getWeatherData(city!);

    searchWeatherList = searchWeatherModel?.weathers ?? [];
    searchedIcons = searchWeatherList.firstOrNull?.iconCode;
    iconPath = searchIcons(searchedIcons ?? '');
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
    // print('========================$searchedCity');
    await weatherData();
    log('$bookMark');
    notifyListeners();
  }

  Future<void> getWeatherData() async {
    ShrHelper helper = ShrHelper();
    searchedCity = await helper.getBookmarkedCity();
    notifyListeners();
  }

  DecorationImage dynamicImages(String? img) {
    return DecorationImage(
      fit: BoxFit.cover,
      image: img == 'haze' || img == 'Fog' || img == 'Smoke'
          ? const AssetImage("assets/images/foggy.jpg")
          : img == 'snow'
              ? const AssetImage('assets/images/snowWeather.jpg')
              : img == 'rainy' || img == 'cloud' || img == 'Rain'
                  ? const AssetImage('assets/images/rainy.jpg')
                  : img == 'sun' || img == 'sunny'
                      ? const AssetImage('assets/images/sunnyWeather.jpg')
                      : img == 'suuny rainy'
                          ? const AssetImage("assets/images/sunny&rainy.jpg")
                          : img == 'thunderstorm'
                              ? const AssetImage(
                                  'assets/images/Thunderstorm.jpg')
                              : img == 'Clouds' || img == 'cloud'
                                  ? const AssetImage('assets/images/cloud.jpg')
                                  : const AssetImage('assets/images/clear.jpg'),
    );
  }

  String? searchIcons(String iconCode) {
    switch (iconCode) {
      case '01d':
        return 'assets/icons/01d.png';
      case '01n':
        return 'assets/icons/01n.png';
      // break;
      case '02d':
      case '02n':
        return 'assets/icons/02dn.png';
      // break;
      case '03d':
      case '03n':
      case '04d':
      case '04n':
        return 'assets/icons/03dn.png';
      // break;
      case '09d':
      case '09n':
      case '10d':
      case '10n':
        return 'assets/icons/0910dn.png';
      // break;
      case '11d':
      case '11n':
        'assets/icons/11dn.png';
      // break;
      case '13d':
      case '13n':
        return 'assets/icons/13dn.png';
      // break;
      default:
        return 'assets/icons/02dn.png';
    }
    log(iconCode);
    return null;
  }
}
