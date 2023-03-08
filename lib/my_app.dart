import 'package:flutter/material.dart';
import 'package:weather_app_flutter/constants/text_constants.dart';
import 'package:weather_app_flutter/features/main_app_screen/screen/weather_home_screen.dart';
import 'package:weather_app_flutter/theme/weather_app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: TextConstants.appName,
      theme: WeatherAppTheme.light(),
      home: const WeatherHomeScreen(),
    );
  }
}
