// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import 'package:weather_app_flutter/repositories/geolocation_repository/geolocation_repository.dart';

import '../../models/current_user_geolocation_model/current_user_geolocation_model.dart';

part 'geolocation_bloc_event.dart';
part 'geolocation_bloc_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  GeolocationBloc({
    required this.geolocationRepository,
  }) : super(GeolocationState()) {
    on<GetPosition>(_getLocationEvent);
  }
  final GeolocationRepository geolocationRepository;

  void _getLocationEvent(
      GetPosition event, Emitter<GeolocationState> emit) async {
    try {
      emit(state.copyWith(status: GeolocationStateStatus.loading));

      var _currentLocation = await geolocationRepository.getPosition();

      emit(
        state.copyWith(
          currentUserLocation: _currentLocation,
          status: GeolocationStateStatus.success,
        ),
      );
    } on CurrentGeolocationFailure catch (e) {
      emit(
        state.copyWith(
          status: GeolocationStateStatus.error,
          errorMessage: e.error,
        ),
      );
    }
  }
}
