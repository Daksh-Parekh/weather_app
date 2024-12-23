class WeatherDataModel {
  int? visibility;
  String? countryName;
  List<WeatherListModel>? weathers = [];
  SysModel? sys;
  MainModel? mainModels;
  WindModel? windsModel;

  WeatherDataModel(
      {this.visibility,
      this.countryName,
      this.weathers,
      this.sys,
      this.mainModels,
      this.windsModel});

  factory WeatherDataModel.mapToModel(Map m3) {
    List weath = m3['weather'];
    return WeatherDataModel(
      visibility: m3['visibility'],
      countryName: m3['name'],
      sys: SysModel.mapToModel(m3['sys']),
      mainModels: MainModel.mapToModel(m3['main']),
      windsModel: WindModel.mapToModel(m3['wind']),
      weathers: weath
          .map(
            (e) => WeatherListModel.mapToModel(e),
          )
          .toList(),
    );
  }
}

class WeatherListModel {
  String? main, description, iconCode;

  WeatherListModel({this.main, this.description, this.iconCode});

  factory WeatherListModel.mapToModel(Map m2) {
    return WeatherListModel(
      main: m2['main'],
      description: m2['description'],
      iconCode: m2['icon'],
    );
  }
}

class WindModel {
  double? windSpeed;

  WindModel({this.windSpeed});

  factory WindModel.mapToModel(Map m5) {
    return WindModel(
      windSpeed: m5['speed'],
    );
  }
}

class MainModel {
  double? temp, tempMin, tempMax;
  int? pressure, huminity, seaLevel, grndLevel;
  num? feelsLike;

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

class SysModel {
  String? country;
  int? sunrise, sunset;

  SysModel({this.country, this.sunrise, this.sunset});

  factory SysModel.mapToModel(Map m1) {
    return SysModel(
        country: m1['country'], sunrise: m1['sunrise'], sunset: m1['sunset']);
  }
}
