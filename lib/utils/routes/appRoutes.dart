import 'package:flutter/material.dart';
import 'package:weather_app/screens/bookmark/views/bookmarkPage.dart';
import 'package:weather_app/screens/home/views/homePage.dart';
import 'package:weather_app/screens/search/views/searchPage.dart';
import 'package:weather_app/screens/splash/views/splashScreen.dart';

class AppRoutes {
  static String splashScreen = '/';
  static String homePage = '/home_page';
  static String searchPage = 'search_page';
  static String bookmarkPage = 'book_mark';

  static Map<String, Widget Function(BuildContext)> routes = {
    splashScreen: (context) => Splashscreen(),
    homePage: (context) => const HomePage(),
    searchPage: (context) => const SearchPage(),
    bookmarkPage: (context) => const BookmarkPage(),
  };
}
