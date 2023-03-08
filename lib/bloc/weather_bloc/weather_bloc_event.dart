part of 'weather_bloc_bloc.dart';

@immutable
abstract class WeatherBlocEvent extends Equatable {}

class WeatherLoadData extends WeatherBlocEvent {
  final double latitude;
  final double longitude;
  WeatherLoadData({
    required this.latitude,
    required this.longitude,
  });
  @override
  List<Object?> get props => [latitude, longitude];
}
