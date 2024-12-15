import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/home_page/provider/home_provider.dart';
import 'package:weather_app/screens/home_page/views/home_page.dart';
import 'package:weather_app/screens/search_page/views/search_page.dart';
import 'package:weather_app/utils/routes/app_routes.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //   // SystemUiOverlayStyle.dark,
  //   SystemUiOverlayStyle(
  //     statusBarBrightness: Brightness.dark,
  //     statusBarColor: Colors.white,
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeProvider(),
        ),
      ],
      child: MaterialApp(
        routes: AppRoutes.routes,
        darkTheme: ThemeData(brightness: Brightness.dark),
        // theme: ThemeData(brightness: Brightness.dark),
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
