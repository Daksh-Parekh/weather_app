import 'package:flutter/material.dart';
import 'package:weather_app/utils/routes/appRoutes.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, AppRoutes.homePage),
    );
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/weathersplashscreen.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
