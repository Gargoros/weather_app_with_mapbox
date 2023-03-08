part of 'geolocation_bloc_bloc.dart';

enum GeolocationStateStatus { initial, success, error, loading }

extension GeolocationStateStatusX on GeolocationStateStatus {
  bool get isInitial => this == GeolocationStateStatus.initial;
  bool get isSuccess => this == GeolocationStateStatus.success;
  bool get isError => this == GeolocationStateStatus.error;
  bool get isLoading => this == GeolocationStateStatus.loading;
}

class GeolocationState extends Equatable {
  const GeolocationState({
    this.status = GeolocationStateStatus.initial,
    LatLng? initLocation,
    CurrentUserGeolocationModel? currentUserLocation,
    String? errorMessage,
  })  : currentUserLocation =
            currentUserLocation ?? CurrentUserGeolocationModel.empty,
        initLocation = initLocation ?? const LatLng(40.4167, -3.70325),
        errorMessage = errorMessage ?? '';

  final GeolocationStateStatus status;
  final CurrentUserGeolocationModel currentUserLocation;
  final LatLng initLocation;
  final String errorMessage;

  @override
  List<Object?> get props => [
        status,
        currentUserLocation,
        initLocation,
        errorMessage,
      ];

  GeolocationState copyWith({
    GeolocationStateStatus? status,
    CurrentUserGeolocationModel? currentUserLocation,
    LatLng? initLocation,
    Position? position,
    String? errorMessage,
  }) {
    return GeolocationState(
      status: status ?? this.status,
      currentUserLocation: currentUserLocation ?? this.currentUserLocation,
      initLocation: initLocation ?? this.initLocation,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
