import 'package:flutter/material.dart';
import 'package:weather/splashscreen.dart';


void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
		@override
		Widget build(BuildContext context) {
				return MaterialApp(
						title: 'Weather',
						debugShowCheckedModeBanner: false,
						theme: ThemeData(
								scaffoldBackgroundColor: Colors.black,
								primaryColor: Colors.blue,
						),
						home: SplashScreen(),
				);
		}
}