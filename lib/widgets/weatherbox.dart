import 'package:flutter/material.dart';
import 'package:weather/models/weather.dart';


class WeatherBox extends StatelessWidget {

		final Weather weather;
		WeatherBox({ this.weather });

		@override
		Widget build(BuildContext context) {
				return Expanded(
						child: Center(
								child: Column(
										mainAxisSize: MainAxisSize.min,
										children: <Widget>[
												Row(
														mainAxisSize: MainAxisSize.min,
														children: <Widget>[
																Row(
																		mainAxisSize: MainAxisSize.min,
																		crossAxisAlignment: CrossAxisAlignment.start,
																		children: <Widget>[
																				Text(
																						weather.temperature.toString(),
																						style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w900, color: Colors.white),
																				),
																				SizedBox(width: 5),
																				Text(
																						'O',
																						style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w800, color: Colors.white),
																				),
																				SizedBox(width: 2),
																				Text(
																						'C',
																						style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w300, color: Colors.white),
																				),
																		],
																),
																Container(
																		width: 1,
																		height: 23,
																		color: Colors.yellow,
																		margin: EdgeInsets.symmetric(horizontal: 13),
																),
																Text(
																		weather.condition,
																		style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w300, color: Colors.white),
																),
														],
												),
												SizedBox(height: 3.0),
												Text(
														weather.description,
														style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300, color: Colors.grey),
												),
										],
								),
						),
				);
		}



}