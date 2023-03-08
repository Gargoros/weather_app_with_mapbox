class CurrentUserGeolocationModel {
  final double latitude;
  final double longitude;

  const CurrentUserGeolocationModel({
    required this.latitude,
    required this.longitude,
  });

  static const empty = CurrentUserGeolocationModel(latitude: 0, longitude: 0);
}
