import 'city.dart';
import 'list.dart';

class ForecastWeatherModel {
  String? cod;
  int? message;
  int? cnt;
  List<WeatherList>? list;
  City? city;

  ForecastWeatherModel({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) {
    return ForecastWeatherModel(
      cod: json['cod'] as String?,
      message: json['message'] as int?,
      cnt: json['cnt'] as int?,
      list: List<WeatherList>.from(
          json["list"].map((x) => WeatherList.fromJson(x))),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'cod': cod,
        'message': message,
        'cnt': cnt,
        'list': List<dynamic>.from(list!.map((x) => x.toJson())),
        'city': city?.toJson(),
      };
}
