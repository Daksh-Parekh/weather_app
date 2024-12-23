import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class ShrHelper {
  Future<void> setBookmarkedCity(String city) async {
    log(city);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('bookMarks', city);
  }

  Future<String?> getBookmarkedCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('bookMarks');
  }
}
