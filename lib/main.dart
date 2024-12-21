import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/home/provider/home_provider.dart';
import 'package:weather_app/utils/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: HomeProvider()..initMethod()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes,
      ),
    );
  }
}
