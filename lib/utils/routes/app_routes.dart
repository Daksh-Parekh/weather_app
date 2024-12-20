import 'package:flutter/material.dart';
import 'package:weather_app/screens/home/views/home_page.dart';
import 'package:weather_app/screens/search/views/search_page.dart';

class AppRoutes {
  static String homePage = '/';
  static String searchPage = 'search_page';

  static Map<String, Widget Function(BuildContext)> routes = {
    homePage: (context) => const HomePage(),
    searchPage: (context) => const SearchPage(),
  };
}
