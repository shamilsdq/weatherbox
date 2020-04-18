import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/widgets/forecastbox.dart';
import 'package:weather/widgets/weatherbox.dart';


class Home extends StatelessWidget {

		final Weather weather;
		final LocationData locationData;
		Home({ this.locationData, this.weather });

		@override
		Widget build(BuildContext context) {
				return Scaffold(
						body: SafeArea(
								child: Column(
										mainAxisSize: MainAxisSize.max,
										children: <Widget>[
												WeatherBox(weather: weather),
												ForecastBox(locationData: locationData),
										],
								),
						),
				);
		}
}