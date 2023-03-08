import 'current_weaather_model/current_weather_model.dart';
import 'forecast_weather_model/forecast_weather_model.dart';

class WeatherData {
  final CurrentWeatherModel? currentData;
  final ForecastWeatherModel? forecastData;
  WeatherData([
    this.currentData,
    this.forecastData,
  ]);

  //function to fetch these values
  CurrentWeatherModel getCurrentWeather() => currentData!;
  ForecastWeatherModel getForecastWeather() => forecastData!;
}
