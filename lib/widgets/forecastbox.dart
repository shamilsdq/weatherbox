import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/services/apiservice.dart';
import 'package:weather/models/forecast.dart';


class ForecastBox extends StatefulWidget {

		final LocationData locationData;
		ForecastBox({ this.locationData });

		@override
		State createState() => ForecastBoxState();

}


class ForecastBoxState extends State<ForecastBox> {

		bool loading = true;
		Forecast forecast;

		@override
		void initState() {
				super.initState();
				getForecast();
		}

		@override
		Widget build(BuildContext context) {
				return Container(
						height: 170,
						width: double.infinity,
						child: loading? null : ListView.builder(
								scrollDirection: Axis.horizontal,
								padding: EdgeInsets.fromLTRB(10, 0, 20, 10),
								itemCount: forecast.list.length,
								itemBuilder: (context, index) {
										Weather weather = forecast.list[index];
										return Card(
												color: Color(0xff121212),
												margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
												child: Container(
														width: 130,
														alignment: Alignment.center,
														child: Column(
																mainAxisSize: MainAxisSize.min,
																children: <Widget>[
																		Row(
																				mainAxisSize: MainAxisSize.min,
																				crossAxisAlignment: CrossAxisAlignment.start,
																				children: <Widget>[
																						Text(
																								weather.temperature.toString(),
																								style: TextStyle(color: Colors.yellow, fontSize: 20.0),
																						),
																						SizedBox(width: 4.0),
																						Text(
																								'O',
																								style: TextStyle(color: Colors.yellow, fontSize: 10.0),
																						),
																						SizedBox(width: 2.0),
																						Text(
																								'C',
																								style: TextStyle(color: Colors.yellow, fontSize: 20.0),
																						),
																				],
																		),
																		Container(
																				height: 1,
																				margin: EdgeInsets.fromLTRB(35, 10, 35, 15),
																				color: Colors.white,
																		),
																		Text(
																				weather.condition,
																				style: TextStyle(color: Color(0xffdddddd), fontSize: 15.0),
																		),
																],
														),
												),
										);
								},
						),
				);
		}


		getForecast() {
				APIService().getForecast(widget.locationData).then((_forecast){
						forecast = _forecast;
						setState(() => loading = false);
				});
		}

}