import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/constants/text_constants.dart';

import 'package:weather_app_flutter/models/current_user_geolocation_model/current_user_geolocation_model.dart';

class InfoCardWidget extends StatelessWidget {
  final CurrentUserGeolocationModel currentUserGeolocationModel;
  const InfoCardWidget({
    Key? key,
    required this.currentUserGeolocationModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              TextConstants.youAreHere,
              style: GoogleFonts.acme(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${TextConstants.latitude}: ${currentUserGeolocationModel.latitude}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "${TextConstants.longitude}: ${currentUserGeolocationModel.longitude}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
    );
  }
}
