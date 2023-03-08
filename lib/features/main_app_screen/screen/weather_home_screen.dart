import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/constants/text_constants.dart';
import 'package:weather_app_flutter/features/map/layout/map_layout.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../../bloc/geolocation_bloc/geolocation_bloc_bloc.dart';
import '../../../repositories/geolocation_repository/geolocation_repository.dart';
import '../../current_weather/screen/current_weather_body.dart';
import '../../forecast_weather/screen/forecast_weather_body.dart';

class WeatherHomeScreen extends StatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  State<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = <Widget>[
    const CurrentWeatherBody(),
    const ForecastWeatherBody(),
    const MapLayOut(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => GeolocationRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<GeolocationBloc>(
              create: (context) => GeolocationBloc(
                  geolocationRepository: context.read<GeolocationRepository>())
                ..add(GetPosition()),
            ),
          ],
          child: _screens[_selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Theme.of(context).primaryColorDark,
          unselectedItemColor: Theme.of(context).unselectedWidgetColor,
          selectedLabelStyle: GoogleFonts.acme(fontSize: 16),
          selectedIconTheme: const IconThemeData(size: 40),
          unselectedIconTheme: const IconThemeData(size: 20),
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Column(
                children: const [
                  SizedBox(
                    child: Icon(
                      WeatherIcons.day_sunny,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
              label: TextConstants.today,
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: const [
                  SizedBox(
                    child: Icon(
                      WeatherIcons.cloudy,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
              label: TextConstants.forecast,
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: const [
                  SizedBox(
                    child: Icon(
                      Icons.location_on_outlined,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
              label: TextConstants.map,
            ),
          ]),
    );
  }
}
