// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:geolocator/geolocator.dart';

import 'package:weather_app_flutter/models/current_user_geolocation_model/current_user_geolocation_model.dart';

import '../../constants/text_geolocation_constants.dart';

class CurrentGeolocationFailure implements Exception {
  final String error;
  CurrentGeolocationFailure({
    required this.error,
  });
}

class GeolocationRepository {
  late Position position;
  GeolocationRepository();

  Future<CurrentUserGeolocationModel> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw CurrentGeolocationFailure(
          error: TextGeolocatorConstants.notEnabled);
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw CurrentGeolocationFailure(error: TextGeolocatorConstants.denied);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw CurrentGeolocationFailure(
          error: TextGeolocatorConstants.deniedForever);
    }

    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final latitude = position.latitude;
    final longitude = position.longitude;

    if (latitude == null || longitude == null) {
      throw CurrentGeolocationFailure(
          error: TextGeolocatorConstants.latAndLonNull);
    }

    return CurrentUserGeolocationModel(
        latitude: latitude, longitude: longitude);
  }
}
