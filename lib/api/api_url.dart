import 'api_key.dart';

String currentApiUrl(var lat, var long) {
  String url;
  url =
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=${ApiKey.apiKey}.&units=metric";

  return url;
}

String forecastApiUrl(var lat, var long) {
  String url;
  url =
      "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$long&appid=${ApiKey.apiKey}&units=metric";

  return url;
}
