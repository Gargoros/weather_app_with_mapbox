import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app_flutter/models/forecast_weather_model/forecast_weather_model.dart';
import 'package:weather_app_flutter/models/weather_data_model.dart';

import '../models/current_weaather_model/current_weather_model.dart';
import 'api_url.dart';

class ApiFetchWeather {
  final dio = Dio();

  WeatherData? weatherData;

  Future<WeatherData> processData(lat, long) async {
    try {
      final Response responseCurrent = await dio.get(currentApiUrl(lat, long));
      var jsonStringCurrent = jsonDecode(responseCurrent.data);
      final Response responseForecast =
          await dio.get(forecastApiUrl(lat, long));
      var jsonStringForecast = jsonDecode(responseForecast.data);

      weatherData = WeatherData(CurrentWeatherModel.fromJson(jsonStringCurrent),
          ForecastWeatherModel.fromJson(jsonStringForecast));

      return weatherData!;
    } catch (error) {
      rethrow;
    }
  }
}
