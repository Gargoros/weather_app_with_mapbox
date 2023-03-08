import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_flutter/bloc/geolocation_bloc/geolocation_bloc_bloc.dart';
import 'package:weather_app_flutter/features/map/widgets/map_body_widget.dart';

import '../../../utils/geolocation_error_widget.dart';

class MapLayOut extends StatelessWidget {
  const MapLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GeolocationBloc, GeolocationState>(
        buildWhen: (prev, current) =>
            current.status.isLoading ||
            current.status.isError ||
            current.status.isSuccess,
        builder: (context, state) {
          if (state.status.isSuccess) {
            return MapBodyWidget(
                currentUserGeolocationModel: state.currentUserLocation);
          }
          if (state.status.isError) {
            return GeolocationErrorWidget(
                errorMessage: state.errorMessage.toString());
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
