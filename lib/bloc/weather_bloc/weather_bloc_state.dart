part of 'weather_bloc_bloc.dart';

@immutable
abstract class WeatherBlocState extends Equatable {}

class WeatherBlocInitial extends WeatherBlocState {
  @override
  List<Object?> get props => [];
}

class WeatherBlocLoading extends WeatherBlocState {
  @override
  List<Object?> get props => [];
}

class WeatherBlocLoaded extends WeatherBlocState {
  final WeatherData weatherData;

  WeatherBlocLoaded(this.weatherData);
  @override
  List<Object?> get props => [weatherData];
}

class WeatherBlocError extends WeatherBlocState {
  final String error;
  WeatherBlocError({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}
