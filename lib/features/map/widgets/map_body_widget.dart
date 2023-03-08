import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../../../api/mapbox_api_key.dart';
import '../../../models/current_user_geolocation_model/current_user_geolocation_model.dart';
import 'info_card_widget.dart';
import 'zoom_in_out_widget.dart';

class MapBodyWidget extends StatefulWidget {
  final CurrentUserGeolocationModel currentUserGeolocationModel;
  const MapBodyWidget({
    Key? key,
    required this.currentUserGeolocationModel,
  }) : super(key: key);

  @override
  State<MapBodyWidget> createState() => _MapBodyWidgetState();
}

class _MapBodyWidgetState extends State<MapBodyWidget> {
  MapboxMapController? mapController;

  _onMapCreated(MapboxMapController controller) async {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MapboxMap(
          styleString:
              "mapbox://styles/mikhailzhacko/clen77ag6006d01o9tjly4qq8",
          accessToken: MapBoxApiKey.mapBoxApiKey,
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          trackCameraPosition: true,
          initialCameraPosition: CameraPosition(
            target: LatLng(
              widget.currentUserGeolocationModel.latitude,
              widget.currentUserGeolocationModel.longitude,
            ),
            zoom: 9,
          ),
          onMapClick: (_, latlng) async {
            await mapController?.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                bearing: 10.0,
                zoom: 13,
                tilt: 30,
                target: LatLng(latlng.latitude, latlng.longitude),
              ),
            ));
          },
        ),
        Positioned(
          top: 5,
          child: InfoCardWidget(
            currentUserGeolocationModel: widget.currentUserGeolocationModel,
          ),
        ),
        Positioned(
          right: 10,
          top: MediaQuery.of(context).size.height * .65,
          child: ZoomInOutWidget(
            zoomInCallback: () async =>
                {mapController?.animateCamera(CameraUpdate.zoomIn())},
            zoomOutCallback: () async =>
                {mapController?.animateCamera(CameraUpdate.zoomOut())},
          ),
        )
      ],
    );
  }
}
