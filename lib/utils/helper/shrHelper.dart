import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class ShrHelper {
  Future<void> setBookmarkedCity(
      {required List<String> city, required String searchCity}) async {
    log('$city');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('bookMark', searchCity);
    await prefs.setStringList('bookMarks', city);
  }

  Future<List<String>?> getBookmarkedCityL() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // return prefs.getString('bookMarks');
    return prefs.getStringList('bookMarks');
  }

  Future<String?> getBookmarkedCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // return prefs.getString('bookMarks');
    return prefs.getString('bookMark');
  }
}
