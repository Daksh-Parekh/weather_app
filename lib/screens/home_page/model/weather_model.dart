class WeatherDataModel {
  int? visibility;
  String? countryName;
  List<WeatherListModel>? weathers = [];
  sysModel? sys;
  MainModel? mainModels;

  WeatherDataModel(
      {this.visibility,
      this.countryName,
      this.weathers,
      this.sys,
      this.mainModels});

  factory WeatherDataModel.mapToModel(Map m3) {
    List weath = m3['weather'];
    return WeatherDataModel(
      visibility: m3['visibility'],
      countryName: m3['name'],
      sys: sysModel.mapToModel(m3['sys']),
      mainModels: MainModel.mapToModel(m3['main']),
      weathers: weath
          .map(
            (e) => WeatherListModel.mapToModel(e),
          )
          .toList(),
    );
  }
}

class WeatherListModel {
  String? main, description;

  WeatherListModel({this.main, this.description});

  factory WeatherListModel.mapToModel(Map m2) {
    return WeatherListModel(
      main: m2['main'],
      description: m2['description'],
    );
  }
}

class MainModel {
  double? temp, feelsLike, tempMin, tempMax;
  int? pressure, huminity, seaLevel, grndLevel;

  MainModel(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.huminity,
      this.seaLevel,
      this.grndLevel});

  factory MainModel.mapToModel(Map m4) {
    return MainModel(
      temp: m4['temp'],
      feelsLike: m4['feels_like'],
      tempMin: m4['temp_min'],
      tempMax: m4['temp_max'],
      pressure: m4['pressure'],
      huminity: m4['humidity'],
      seaLevel: m4['sea_level'],
      grndLevel: m4['grnd_level'],
    );
  }
}

class sysModel {
  String? country;

  sysModel({this.country});

  factory sysModel.mapToModel(Map m1) {
    return sysModel(country: m1['country']);
  }
}
